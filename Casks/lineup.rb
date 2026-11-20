cask "lineup" do
  version "0.3.0"
  sha256 "3a58fbf6e44dac14d5f42cee98af8d860b0dd04da260409dc859ba959451a527"

  url "https://github.com/Furcenzo/lineup/releases/download/v#{version}/Lineup-#{version}.zip"
  name "Lineup"
  desc "Window switcher like Alt+Tab on Windows"
  homepage "https://github.com/Furcenzo/lineup"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Lineup.app"

  # Quitting Lineup gives ⌘Tab back to the system app switcher.
  uninstall quit: "io.github.furcenzo.lineup"

  zap trash: [
    "~/Library/Preferences/io.github.furcenzo.lineup.plist",
    "~/Library/Preferences/io.github.furcenzo.wintab.plist",
  ]

  caveats <<~EOS
    Lineup (formerly WinTab) replaces ⌘Tab with a window switcher (Settings can
    switch it to ⌥Tab). On the first start it asks for the Accessibility
    permission (required) and Screen & System Audio Recording (optional, for
    window previews).

    Lineup is not notarized by Apple, so macOS may refuse to open it.
    If it does, open System Settings → Privacy & Security and click
    "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Lineup.app"

    After an update macOS may forget the permissions: remove Lineup from both
    lists in System Settings → Privacy & Security and allow it again.
    Coming from WinTab: allow Lineup there anew and remove WinTab from the lists.
  EOS
end
