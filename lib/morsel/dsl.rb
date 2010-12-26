module Morsel
  class Dsl
    attr_reader :recipes

    def self.evaluate(morselfile)
      builder = new
      builder.instance_eval(File.read(morselfile))
      builder.recipes
    end

    def initialize
      @recipes = Array.new
    end

    def morsel(name)
      recipe = Recipe.new(name)
      yield(recipe)
      @recipes << recipe
      recipe
    end

  end
end
