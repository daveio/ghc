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
      puts "Would clone #{parse_repo(repo)}"
    end

    def detect_type(repo)
      return :github if repo.match %r{^[a-zA-Z0-9_\-]+/[a-zA-Z0-9_\-]+$}
      return :ssh_user if repo.match %r{^[a-zA-Z0-9_\-]+@[a-zA-Z0-9\-.]+:.*$}
      return :ssh_no_user if repo.match %r{^[a-zA-Z0-9\-.]+:.*$}
      return :long_https if repo.match %r{^https://[a-zA-Z0-9\-.]+/.*$}
      return :short_https if repo.match %r{^[a-zA-Z0-9\-.]+/.*$}

      :unknown
    end

    # trunk-ignore(rubocop/Metrics/MethodLength,rubocop/Metrics/CyclomaticComplexity)
    def parse_repo(repo)
      case detect_type(repo)
      when :github
        user, repo = repo.split('/')
        proto = user == Metadata.github_user ? 'git' : 'https'
        return {
          host: 'github.com',
          proto: proto,
          repo: repo,
          ssh_user: 'git',
          user: user
        }
      when :ssh_user
        matches = repo.match %r{^(?<user>[a-zA-Z0-9_\-]+)@(?<host>[a-zA-Z0-9\-.]+):(?<path>.*)$}
        return {
          host: matches[:host],
          proto: 'ssh',
          repo: matches[:path],
          ssh_user: 'git',
          user: matches[:user]
        }
      when :ssh_no_user
        "#{repo} ssh without user"
      when :long_https
        "#{repo} long https"
      when :short_https
        "#{repo} short https"
      when :unknown
        abort("Couldn't detect repo type for #{repo}. File a bug report at https://github.com/daveio/ghc/issues.")
      end
      nil
    end
  end
end
