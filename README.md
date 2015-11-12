Ruby Quirks
===========

[![Build Status](https://travis-ci.org/delner/ruby_quirks.svg?branch=master)](https://travis-ci.org/delner/ruby_quirks) ![Gem Version](https://badge.fury.io/rb/ruby_quirks.svg)
###### *For Ruby 1.9.3, 2.0.x, 2.1.x, 2.2.x*

### Introduction

`ruby_quirks` is a gem which adds a collection of optional Ruby hotfixes and common idioms to accommodate for some of Ruby's quirky behaviors. See the list below to see what's offered.

### Hotfixes

#### Hash#reject and Hash#select returns Hash for subclasses of Hash

 - **For Ruby versions:** 2.2.0+
 - **Description:** Calling `#reject` or `#select` against an instance of a class that inherits from `Hash` will return an object of type `Hash`, rather than an object of the same type that `#reject` or `#select` was called against. e.g. This broke Rails' `HashWithIndifferentAccess`. See [this question](http://stackoverflow.com/questions/33638665/ruby-2-2-hashreject-returning-hash-for-inheriting-classes) for more details.
 - **What this hotfix does:** It overrides `#reject` and `#select` of implementing classes to use `#dup` to return an object of the same type. This effectively replicates pre-2.2 behavior of `Hash`.
 - **How to implement:** Include the `RubyQuirks::Hash::EnumByDup` in your class that inherits from `Hash`
 - **Example:**
        
        module CustomHash < Hash
          include RubyQuirks::Hash::EnumByDup
        end

### Changelog

#### Version 0.0.1

 - Initial version of Ruby Quirks
 - Added: `RubyQuirks::Hash::EnumByDup`
