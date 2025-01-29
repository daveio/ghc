# `ghc`

`ghc` is a command-line tool for managing GitHub repositories.

## Before you start

You need to set two environment variables.

### `GHC_ROOT`

Set the `GHC_ROOT` environment variable to the root directory of your repositories. `ghc` will bomb out if this is not set, or if it is not set to a valid writable directory.

Paths will be created relative to this root directory. For example, a GitHub checkout of `daveio/ghc` will be located at`$GHC_ROOT/github.com/daveio/ghc`.

### `GHC_GITHUB_USER`

Set the `GHC_GITHUB_USER` environment variable to your GitHub username. This is used to switch to using SSH to check out repositories that you own, with HTTPS used for other users' repositories.

### `sh` / `bash` / `zsh`

```sh
export GHC_ROOT=$HOME/src
export GHC_GITHUB_USER=daveio
```

### `fish`

```fish
set -gx GHC_ROOT $HOME/src
set -gx GHC_GITHUB_USER daveio
```

## Installation

```sh
gem install ghc
```

## Usage

### Show version

```sh
ghc version
```

## Clone a repository

```sh
ghc clone daveio/ghc
```
