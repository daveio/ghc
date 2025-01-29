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

  # trunk-ignore(rubocop/Metrics/CyclomaticComplexity)
  def detect_type(repo)
    return :github_short if repo.match %r{^[a-zA-Z]+/[a-zA-Z]+$}
    return :github_long_https if repo.match %r{^https://github.com/[a-zA-Z]+/[a-zA-Z]+$}
    return :github_short_https if repo.match %r{^github.com/[a-zA-Z]+/[a-zA-Z]+$}
    return :github_ssh if repo.match %r{^git@github.com:[a-zA-Z]+/[a-zA-Z]+$}
    return :other_long_https if repo.match %r{^https://[a-zA-Z]+\.[a-zA-Z]+\.?[a-zA-Z]+?/[a-zA-Z]+}
    return :other_short_https if repo.match %r{^[a-zA-Z]+\.[a-zA-Z]+\.?[a-zA-Z]+?/[a-zA-Z]+}
    return :other_ssh if repo.match %r{^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+\.?[a-zA-Z]+?:/?[a-zA-Z]+}

    :unknown
  end
end
