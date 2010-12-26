morsel: git submodules are overkill
===================================

I want to user other people's code.  Most of the time, I don't want to use `git submodules`.  For those times, I wrote `morsel`.

Point `morsel` at a git repository and tell it which files you want. It'll fetch them for you and place them into your source tree.

Problem
-------

There is no dependency management system for Cocoa development.  Everytime I want to use a new library, my options are:

1) Clone the repository. Figure out which files I need. Copy them into my source tree.
2) Add a git submodule.

Both options are annoying in their own way. Inspired by [bundler](http://gembundler.com/) and [homebrew](http://mxcl.github.com/homebrew/), I present `morsel`.

Install
-------

`morsel` is available as a RubyGem

    $ gem install morsel

Usage
-----

Create a `Morselfile` in your project's root that looks something like this:

    morsel 'jsonkit' do |m|
        m.url = 'https://github.com/johnezang/JSONKit.git'
        m.files = %w{
            JSONKit.h
            JSONKit.m
        }
    end

Then run `morsel install`.  It'll clone the repos into `~/.morsel/repos` and then copy your desired files into a `morsels` directory in your project's root:

    $ find .
    .
    ./Morselfile
    ./morsels
    ./morsels/jsonkit
    ./morsels/jsonkit/JSONKit.h
    ./morsels/jsonkit/JSONKit.m

That's it!

What's Next
-----------

Well, it's annoying to have to define the url and files for each morsel.  An ideal `Morselfile` would look something like this:

    morsel 'jsonkit', :sha => 'c9ffd8f823e68df96fa2f87185bee861984ef637'
    morsel 'asihttprequest', :tag => 'v1.8'

That'll require some [homebrew](http://mxcl.github.com/homebrew/)-style package management. Stay tuned.
