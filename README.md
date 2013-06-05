# Collmex-Ruby

A Ruby lib for speaking with the german accounting software collmex.

[![Build Status](https://secure.travis-ci.org/romanlehnert/collmex-ruby.png)](http://travis-ci.org/romanlehnert/collmex-ruby)
[![Code Climate](https://codeclimate.com/github/romanlehnert/collmex-ruby.png)](https://codeclimate.com/github/romanlehnert/collmex-ruby)
[![Dependency Status](https://gemnasium.com/romanlehnert/collmex-ruby.png)](https://gemnasium.com/romanlehnert/collmex-ruby)
[![Coverage Status](https://coveralls.io/repos/romanlehnert/collmex-ruby/badge.png)](https://coveralls.io/r/romanlehnert/collmex-ruby)
[![Gem Version](https://badge.fury.io/rb/collmex-ruby.png)](http://badge.fury.io/rb/collmex-ruby)

### Datatypes

While collmex sends and receives only strings via csv, we treat the data as ruby object.

#### Collmex String
Its represented as a string in ruby. There is no length restriction. So you have to care for yourself that collmex can handle all the contents of a Char field.

#### Collmex Float
Collmex floats are represented as floats in ruby too. You can give it a string or a integer too. When we send something to collmex in a float field, it is limited to 2 decimals.

#### Collmex Currency
Collmex has Currency as its own datatype. In ruby we use the smallest unit (cent in €) and take the amount as an integer. We have put some special parsing methods when a string should represent the alue of a currency field. Jus take a look at the spec/lib/collmex/api_spec.rb to see how we handle it.

#### Collmex Integer
Integers are the simples datatype and transparent between ruby and collmex. There is just some special handling that cares for delimiters in numbers to represent the correct value

## Authors:
This lib was originally written for [palabea](http://www.palabea.com) by roman l.