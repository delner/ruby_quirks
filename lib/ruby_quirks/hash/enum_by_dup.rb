# This module was created as a 'patch' for Hash behavior that changes in Ruby 2.2
# http://stackoverflow.com/questions/33638665/ruby-2-2-hashreject-returning-hash-for-inheriting-classes
# Hash#reject now always returns a Hash, rather than an instance of object that invoked #reject
# This new behavior breaks many classes that inherit from Hash
# Include this in classes that inherit from Hash to replicate the pre-2.2 Hash behavior
module RubyQuirks::Hash
  module EnumByDup
    def select(*args, &block)
      return to_enum(:select) unless block_given?
      dup.tap { |hash| hash.select!(*args, &block) }
    end
    def reject(*args, &block)
      return to_enum(:reject) unless block_given?
      dup.tap { |hash| hash.reject!(*args, &block) }
    end
  end
end