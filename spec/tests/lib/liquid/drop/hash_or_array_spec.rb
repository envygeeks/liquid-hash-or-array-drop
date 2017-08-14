# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"

describe Liquid::Drop::HashOrArray do
  shared_examples "One" do
    it { respond_to :last }
    it { respond_to :each }
    it { respond_to :first }
    it { respond_to :each_with_index }
    it { respond_to :to_enum }
    it { respond_to :fetch }
    it { respond_to :to_h }
    it { respond_to :to_a }
    it { respond_to :map }
  end

  #

  describe "with {}" do
    it_behaves_like "One"
    subject do
      described_class.new({
        :hello => :world,
        :world => {
          #
        }
      })
    end

    #

    it "should have missing methods" do
      expect(subject.liquid_method_missing(:hello)).to(eq(:world))
    end

    #

    context "when the val is a Hash or Array" do
      it "should return a HashOrArray" do
        expect(subject[:world]).to(be_a(described_class))
      end
    end
  end

  #

  context "with []" do
    it_behaves_like "One"
    subject do
      described_class.new([
        "hello"
      ])
    end
  end
end
