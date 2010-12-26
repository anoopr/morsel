module Morsel
  class Recipe
    attr_accessor :name, :url, :files

    def initialize(name)
      @name = name
    end

  end
end
