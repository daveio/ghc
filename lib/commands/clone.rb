# frozen_string_literal: true

# Commands module contains all CLI command implementations
module Commands
  # Command to clone repositories
  class Clone
    def initialize(args, options)
      @args = args
      @options = options
      run
    end

    def run
      repo = @args.first
      puts "Would clone #{repo}"
    end
  end

  def detect_type(repo)
    return :github if repo.match %r{^[a-zA-Z]+/[a-zA-Z]+$}
    return :ssh if repo.match %r{^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+\.?[a-zA-Z]+?:/?[a-zA-Z]+}
    return :long_https if repo.match %r{^https://[a-zA-Z]+\.[a-zA-Z]+\.?[a-zA-Z]+?/[a-zA-Z]+}
    return :short_https if repo.match %r{^[a-zA-Z]+\.[a-zA-Z]+\.?[a-zA-Z]+?/[a-zA-Z]+}

    :unknown
  end
end
