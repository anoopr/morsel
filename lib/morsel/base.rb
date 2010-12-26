module Morsel
  extend self

  def repo_dir
    File.join(File.expand_path('~'), '.morsel', 'repos')
  end
end
