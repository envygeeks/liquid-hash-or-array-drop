<p align=center>
  <a href=https://goo.gl/BhrgjW>
    <img src=https://envygeeks.io/badges/paypal-large_1.png alt=Donate>
  </a>
  <br>
  <a href=https://travis-ci.org/envygeeks/liquid-hash-or-array-drop>
    <img src="https://travis-ci.org/envygeeks/liquid-hash-or-array-drop.svg?branch=master">
  </a>
</div>

# Liquid Hash Or Array Drop

Provides a drop wrapper for Hashes and Array's that allows Liquid to utilize the data as well as allows you to utilize the data.  It can encapsulate both hashes and arrays in the same instance.

## Usage

```ruby
require "liquid/drop/hash_or_array"
a = Liquid::Drop::HashOrArray.new({
  :hello => :worl
})

a.first # => [:hello, :world]
a.liquid_method_missing(:hello) # => :world
a[:hello] # => :world
```
