require_relative 'base'

module EverydayNatsort::Kernel
end

module Enumerable
  # Add #natural_sort method to Enumerable module.
  #
  # Examples
  #
  #   require 'everyday_natsort_kernel'
  #   ['a1', 'a12', 'a2'].natural_sort     #=> ['a1', 'a2', 'a12']
  #   ['a', 'b', 'A', 'B'].natural_sort    #=> ['A', 'a', 'B', 'b']
  include EverydayNatsort::NaturalSort
end

class Array
  # Add #natural_sort method to Array class.
  #
  # Examples
  #
  #   require 'everyday_natsort_kernel'
  #   ['a1', 'a12', 'a2'].natural_sort     #=> ['a1', 'a2', 'a12']
  #   ['a', 'b', 'A', 'B'].natural_sort    #=> ['A', 'a', 'B', 'b']
  include EverydayNatsort::NaturalSort
end

class Range
  # Add #natural_sort method to Range class, which aliases #to_a
  #
  # Examples
  #
  #   require 'everyday_natsort_kernel'
  #   (1..11).natural_sort    #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  alias :natural_sort :to_a
end

if defined?(Set)
  class Set
    # Add #natural_sort method to Set class, if it has been initialized.
    #
    # Examples
    #
    #   require 'set'
    #   require 'everyday_natsort_kernel'
    #   Set.new(['a', 'b', 'c', 'd', 'A', 'B', 'C', 'D']).natural_sort  #=> ['A', 'a', 'B', 'b', 'C', 'c', 'D', 'd']
    include EverydayNatsort::NaturalSort
  end
end

class Hash
  # Add #natural_sort method to Hash class.
  #
  # Examples
  #
  #   require 'everyday_natsort_kernel'
  #   { "a" => "value", "b" => "value", "A" => "value", "B" => "value" }.natural_sort  #=>
  #     [["A", "value"], ["a", "value"], ["B", "value"], ["b", "value"]]
  include EverydayNatsort::NaturalSort
end