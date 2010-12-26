module Morsel
  module Commands
    extend self

    def install(args)
      recipes = Dsl.evaluate('Morselfile')
      recipes.each {|r| Installer.install_recipe(r)}
    end

  end
end
