# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "forwardable/extended"
require "liquid/drop"

module Liquid
  class Drop
    class HashOrArray < Drop
      extend Forwardable::Extended

      # --
      # @return [<HashOrArray>] the instance
      # There is no need for explaining it.
      # --
      def initialize(data)
        @data = data
      end

      # --
      # @return [<Any>] the value or nil.
      # Standard hash method so that you can also access
      #   the data like a hash/array.
      # --
      def [](key)
        liquid_method_missing(key)
      end

      # --
      # Uses Liquids method missing method to get the key
      #   when you try and access the drop like a chained method
      #   we do the case because oen day we might split out the
      #   class and it would require minimal refactor.
      # @return [<Any>] the value or nil.
      # --
      def liquid_method_missing(key)
        val = @data.fetch(key.to_s, @data[key.to_sym])

        case true
        when val.is_a?(Array) then HashOrArray.new(val)
        when val.is_a?( Hash) then HashOrArray.new(val)
        else
          val
        end
      end

      # --
      # Delegate methods directly to the hash or the Array,
      #   we don't need to carry these, enumerable does.
      # --

      rb_delegate :keys,             to: :@data
      rb_delegate :last,             to: :@data
      rb_delegate :each,             to: :@data
      rb_delegate :first,            to: :@data
      rb_delegate :values,           to: :@data
      rb_delegate :each_with_index,  to: :@data
      rb_delegate :inspect,          to: :@data
      rb_delegate :to_enum,          to: :@data
      rb_delegate :fetch,            to: :@data
      rb_delegate :to_h,             to: :@data
      rb_delegate :to_a,             to: :@data
      rb_delegate :map,              to: :@data
    end
  end
end
