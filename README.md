Ruby Quirks
===========

[![Build Status](https://travis-ci.org/StreetEasy/ruby_quirks.svg?branch=master)](https://travis-ci.org/StreetEasy/ruby_quirks) ![Gem Version](https://badge.fury.io/rb/ruby_quirks.svg)
###### *For Ruby 1.9.3, 2.0.0, 2.1.0*

### Introduction

`ruby_quirks` is a gem which adds a collection of optional Ruby hotfixes and common idioms to accommodate for some of Ruby's quirky behaviors. See the list below to see what's offered.

### Hotfixes

#### Hash#reject and Hash#select returns Hash for subclasses of Hash
**Ruby versions: 2.2.0+**
**Description: