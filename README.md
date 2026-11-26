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
cask "furcenzo/tap/brew-gui", trusted: true
```

(Homebrew only loads casks from third-party taps that you trust; installing by the full name, as above, trusts the cask.)

The app is not notarized by Apple, so macOS may refuse to open it. If that happens, open
**System Settings → Privacy & Security** and click **Open Anyway** next to “Brew GUI”, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/Brew GUI.app"
```

Updates arrive with `brew upgrade`. The cask is updated automatically by Brew GUI's release script.

## Lineup

[Lineup](https://github.com/Furcenzo/lineup) (formerly WinTab) – a window switcher like Alt+Tab on Windows: ⌘Tab
with window previews, windows from all desktops, most recently used first (English and Slovak, macOS 15 or later).

```bash
brew install --cask furcenzo/tap/lineup
```

Or in a Brewfile:

```ruby
tap "furcenzo/tap"
cask "furcenzo/tap/lineup", trusted: true
```

On the first start Lineup asks for the Accessibility permission (required) and Screen & System Audio Recording
(optional, for window previews). It is not notarized by Apple either – if macOS refuses to open it, use
**Open Anyway** in **System Settings → Privacy & Security**, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/Lineup.app"
```

Updates arrive with `brew upgrade`. The cask is updated automatically by Lineup's release script.
The old `wintab` cask was renamed. Coming from WinTab, run `brew install --cask furcenzo/tap/lineup` once: it replaces
the WinTab installation (Homebrew trusts casks from this tap by name, so `brew upgrade` alone skips the renamed one).

## Roundhouse

[Roundhouse](https://github.com/Furcenzo/roundhouse) – a connection launcher: one list of servers and devices, a search
panel on ⌥Space, and SSH, RDP, VNC, web interfaces and WinBox open in the right app (English and Slovak, macOS 15 or
later).

```bash
brew install --cask furcenzo/tap/roundhouse
```

Or in a Brewfile:

```ruby
tap "furcenzo/tap"
cask "furcenzo/tap/roundhouse", trusted: true
```

It is not notarized by Apple either – if macOS refuses to open it, use **Open Anyway** in
**System Settings → Privacy & Security**, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/Roundhouse.app"
```

Updates arrive with `brew upgrade`. The cask is updated automatically by Roundhouse's release script.

## Stowaway

[Stowaway](https://github.com/Furcenzo/stowaway) – a menu bar manager for macOS 27: keep only the icons you want in the
menu bar and open the others from a bar under its suitcase icon (English and Slovak, macOS 27 or later).

```bash
brew install --cask furcenzo/tap/stowaway
```

Or in a Brewfile:

```ruby
tap "furcenzo/tap"
cask "furcenzo/tap/stowaway", trusted: true
```

On the first start Stowaway asks for the Accessibility permission. It must run from /Applications. It is not
notarized by Apple either – if macOS refuses to open it, use **Open Anyway** in
**System Settings → Privacy & Security**, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/Stowaway.app"
```

Updates arrive with `brew upgrade`. The cask is updated automatically by Stowaway's release script.

## Pointsman

[Pointsman](https://github.com/Furcenzo/pointsman) – a menu bar app for developers of Mac apps: which of your apps run as
the installed release and which as the development build, one-click switching, and the development services (Docker VM,
containers, local servers, simulators) with their memory (English and Slovak, macOS 15 or later).

```bash
brew install --cask furcenzo/tap/pointsman
```

Or in a Brewfile:

```ruby
tap "furcenzo/tap"
cask "furcenzo/tap/pointsman", trusted: true
```

It needs no permissions. It is not notarized by Apple either – if macOS refuses to open it, use **Open Anyway** in
**System Settings → Privacy & Security**, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/Pointsman.app"
```

Updates arrive with `brew upgrade`. The cask is updated automatically by Pointsman's release script.
