cask "wintab" do
  version "0.1.1"
  sha256 "0911ff69baba168b10cfb516614493c5f984f86dc2d1913a1a4cd03cc6ccb2e2"

  url "https://github.com/Furcenzo/wintab/releases/download/v#{version}/WinTab-#{version}.zip"
  name "WinTab"
  desc "Window switcher like Alt+Tab on Windows"
  homepage "https://github.com/Furcenzo/wintab"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "WinTab.app"

  # Quitting WinTab gives ⌘Tab back to the system app switcher.
  uninstall quit: "io.github.furcenzo.wintab"

  zap trash: "~/Library/Preferences/io.github.furcenzo.wintab.plist"

  caveats <<~EOS
    WinTab replaces ⌘Tab with a window switcher (Settings can switch it to ⌥Tab).
    On the first start it asks for the Accessibility permission (required) and
    Screen & System Audio Recording (optional, for window previews).

    WinTab is not notarized by Apple, so macOS may refuse to open it.
    If it does, open System Settings → Privacy & Security and click
    "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/WinTab.app"

    After an update macOS may forget the permissions: remove WinTab from both
    lists in System Settings → Privacy & Security and allow it again.
  EOS
end
