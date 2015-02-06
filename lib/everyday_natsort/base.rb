require_relative 'accents'
require_relative 'natural'

module EverydayNatsort
  class << self
    def strip_accents(str)
      EverydayNatsort::Accents.sanitize(str)
    end

    def sort(object)
      EverydayNatsort::Natural.sort(object)
    end

    def compare(a, b)
      EverydayNatsort::Natural.compare(a, b)
    end
  end

  module NaturalSort
    def natural_sort
      EverydayNatsort.sort(self)
    end
  end

  module StripAccents
    def strip_accents
      EverydayNatsort.strip_accents(self)
    end
  end
end