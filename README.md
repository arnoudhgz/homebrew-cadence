# Homebrew tap for Cadence

A personal [Homebrew tap](https://docs.brew.sh/Taps) hosting the cask for [Cadence](https://github.com/arnoudhgz/cadence), an unofficial macOS YouTube Music player.

## Install

```sh
brew tap arnoudhgz/cadence
brew install --cask --no-quarantine cadence
```

Or as a one-liner:

```sh
brew install --cask --no-quarantine arnoudhgz/cadence/cadence
```

### Why `--no-quarantine`?

Cadence is currently *adhoc-signed* (no Apple Developer ID, no notarization). Without `--no-quarantine`, macOS Gatekeeper will block the first launch with *"Cadence cannot be opened because Apple cannot check it for malicious software"* and you'd have to right-click → Open in Finder to bypass it. The flag tells Homebrew to skip applying the quarantine attribute so the first launch just works.

If you forgot the flag, you can fix it after install:

```sh
xattr -dr com.apple.quarantine /Applications/Cadence.app
```

Once Cadence ships a Developer ID-signed build (planned for a future release), the `--no-quarantine` flag won't be needed anymore.

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
