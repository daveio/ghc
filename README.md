# `ghc`

GitHub clone manager

## Config

Default config path: `~/.config/ghc/config.toml`

### Example configuration file

```toml
[main]
# Use libgit to perform git operations if true.
# Use the git CLI to perform git operations if false.
libgit = false # true not yet implemented

[github]
# Your GitHub username.
username = abc123
# Your GitHub token.
token = ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx # Try `gh auth token`.
# Use ssh to clone GitHub repositories that you own.
use_ssh = true
```

## Invocations

### `ghc clone repo`

Clone `github.com/YOURUSERNAME/repo`.

Uses SSH if `github.use_ssh` is `true` in the configuration file, HTTPS
otherwise.

Your username must be set in the configuration file.

### `ghc clone username/repo`

Clone `github.com/username/repo` using HTTPS.

### `ghc clone hostname.com/repo`

Clone `hostname.com/repo` using HTTPS.

### `ghc clone https://hostname.com/repo`

Clone `hostname.com/repo` using HTTPS.

### `ghc clone hostname.com:/repo`

Clone `hostname.com:/repo` using SSH. Uses your username.

### `ghc clone git@hostname.com:/repo`

Clone `hostname.com/repo` using SSH. Uses the specified username.

## Flow

```mermaid

```
