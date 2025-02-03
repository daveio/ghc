# frozen_string_literal: true

require 'etc'

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
      repo = parse_repo(@args.first)
      puts "host: #{repo[:host]}"
      puts "proto: #{repo[:proto]}"
      puts "repo: #{repo[:repo]}"
      puts "ssh_user: #{repo[:ssh_user]}"
      puts "github_user: #{repo[:github_user]}"
      puts "https_url: #{repo[:https_url]}"
      puts "ssh_url: #{repo[:ssh_url]}"
    end

    def detect_type(repo)
      return :github if repo.match %r{^[a-zA-Z0-9_\-]+/[a-zA-Z0-9_\-]+$}
      return :ssh_user if repo.match %r{^[a-zA-Z0-9_\-]+@[a-zA-Z0-9\-.]+:.*$}
      return :ssh_no_user if repo.match %r{^[a-zA-Z0-9\-.]+:.*$}
      return :long_https if repo.match %r{^https://[a-zA-Z0-9\-.]+/.*$}
      return :short_https if repo.match %r{^[a-zA-Z0-9\-.]+/.*$}

      :unknown
    end

    # trunk-ignore(rubocop/Metrics/MethodLength,rubocop/Metrics/CyclomaticComplexity,rubocop/Metrics/AbcSize)
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
          github_user: user,
          https_url: "https://github.com/#{user}/#{repo}.git",
          ssh_url: "git@github.com:#{user}/#{repo}.git"
        }
      when :ssh_user
        matches = repo.match %r{^(?<user>[a-zA-Z0-9_\-]+)@(?<host>[a-zA-Z0-9\-.]+):(?<path>.*)$}
        return {
          host: matches[:host],
          proto: 'ssh',
          repo: matches[:path],
          ssh_user: matches[:user],
          github_user: nil,
          https_url: nil,
          ssh_url: nil
        }
      when :ssh_no_user
        matches = repo.match %r{^(?<host>[a-zA-Z0-9\-.]+):(?<path>.*)$}
        return {
          host: matches[:host],
          proto: 'ssh',
          repo: matches[:path],
          ssh_user: Etc.getlogin,
          github_user: nil,
          https_url: nil,
          ssh_url: nil
        }
      when :long_https
        matches = repo.match %r{^https://(?<host>[a-zA-Z0-9\-.]+)/(?<path>.*)$}
        return {
          host: matches[:host],
          proto: 'https',
          repo: matches[:path],
          ssh_user: nil,
          github_user: nil,
          https_url: nil,
          ssh_url: nil
        }
      when :short_https
        matches = repo.match %r{^(?<host>[a-zA-Z0-9\-.]+)/(?<path>.*)$}
        return {
          host: matches[:host],
          proto: 'https',
          repo: matches[:path],
          ssh_user: nil,
          github_user: nil,
          https_url: nil,
          ssh_url: nil
        }
      when :unknown
        abort("Couldn't detect repo type for #{repo}. File a bug report at https://github.com/daveio/ghc/issues.")
      end
      nil
    end
  end
end
