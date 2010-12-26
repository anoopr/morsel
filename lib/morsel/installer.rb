require 'git'

module Morsel
  module Installer
    extend self

    def install_recipe(recipe)
      repo_dir = File.join(File.expand_path('~'), '.morsel', 'repos')
      FileUtils.mkdir_p(repo_dir) unless File.exists? repo_dir
      g = File.exists?(File.join(repo_dir, recipe.name)) ? Git.open(File.join(repo_dir, recipe.name)) : Git.clone(recipe.url, recipe.name, :path => repo_dir)
      g.pull
      recipe.files.each do |f|
        dirname = File.join('morsels', recipe.name, File.dirname(f))
        FileUtils.mkdir_p(dirname)
        FileUtils.cp(File.join(g.dir.path, f), dirname)
      end
    end

  end
end
