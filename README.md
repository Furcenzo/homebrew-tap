# Furcenzo's Homebrew tap

Homebrew casks for my apps.

## Brew GUI

[Brew GUI](https://github.com/Furcenzo/brew-gui) – a native macOS app for managing Homebrew packages and a Brewfile
(English and Slovak, macOS 15 or later).

```bash
brew install --cask furcenzo/tap/brew-gui
```

Or in a Brewfile:

```ruby
tap "furcenzo/tap"
cask "brew-gui"
```

The app is not notarized by Apple, so macOS blocks its first launch. Open **System Settings → Privacy & Security**
and click **Open Anyway** next to “Brew GUI”, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/Brew GUI.app"
```

Updates arrive with `brew upgrade`. The cask is updated automatically by Brew GUI's release script.
