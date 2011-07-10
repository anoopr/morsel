require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "dsl specs" do
  
  it "parses a basic Morselfile" do
    d = Morsel::Dsl.new
    d.instance_eval <<-MORSELFILE
      morsel 'some_morsel' do |m|
        m.url = 'some_url'
        m.branch = 'some_branch'
        m.files = %w{ file1.txt file2.txt }
      end
    MORSELFILE
    d.recipes.size.should == 1
    d.recipes.first.name.should == 'some_morsel'
    d.recipes.first.url.should == 'some_url'
    d.recipes.first.branch.should == 'some_branch'
    d.recipes.first.files.size.should == 2
    d.recipes.first.files.should == %w{ file1.txt file2.txt }
  end
  
end
