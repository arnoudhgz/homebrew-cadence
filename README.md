# Homebrew tap for Cadence

A personal [Homebrew tap](https://docs.brew.sh/Taps) hosting the cask for [Cadence](https://github.com/arnoudhgz/cadence), an unofficial macOS YouTube Music player.

## Install

```sh
brew tap arnoudhgz/cadence
brew install --cask cadence
```

Or as a one-liner:

```sh
brew install --cask arnoudhgz/cadence/cadence
```

Brew strips the macOS quarantine flag for you, so the first launch works straight from the Dock — no right-click → Open required.

## Update

```sh
brew update
brew upgrade --cask cadence
```

## Uninstall

```sh
brew uninstall --cask cadence
```

Add `--zap` to also wipe user data (login cookies, cache, preferences):

```sh
brew uninstall --cask --zap cadence
```

## Why not in homebrew/cask?

Cadence is brand new and doesn't yet meet [homebrew/cask's notability requirements](https://docs.brew.sh/Acceptable-Casks#rejected-casks) (≥30 stars / forks / watchers). Once it crosses that threshold, the plan is to submit a PR to `homebrew/cask` so that `brew install --cask cadence` works *without* tapping this repo first. Until then, this tap is the official install path.

## License

The cask formula is [MIT-licensed](LICENSE). See the [main Cadence repo](https://github.com/arnoudhgz/cadence) for the app's own license.
