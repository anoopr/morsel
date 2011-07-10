module Morsel
  class Recipe
    attr_accessor :name, :url, :branch, :files

    def initialize(name)
      @name = name
    end

  end
end
