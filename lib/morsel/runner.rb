module Morsel
  class Runner
    def self.execute(*args)
      new(*args).execute
    end

    def initialize(*args)
      @cmd = args.shift
      @args = args
    end

    def execute
      Commands.send(@cmd, @args) if Commands.respond_to?(@cmd)
    end

  end
end
