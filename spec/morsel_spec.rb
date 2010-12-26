require File.dirname(__FILE__) + '/spec_helper.rb'

describe "base specs" do
  
  it "returns the repository directory" do
    Morsel.repo_dir.should match('.morsel/repos')
  end
  
end
