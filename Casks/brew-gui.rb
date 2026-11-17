cask "brew-gui" do
  version "0.5.1"
  sha256 "e673a067aa8cbd09c34f9130f3e5a9430d8abb97a6dc2c599a542313d4554ce5"

  url "https://github.com/Furcenzo/brew-gui/releases/download/v#{version}/Brew-GUI-#{version}.zip"
  name "Brew GUI"
  desc "Manage Homebrew packages and a Brewfile"
  homepage "https://github.com/Furcenzo/brew-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Brew GUI.app"

  zap trash: [
    "~/Library/Application Support/BrewGUI",
    "~/Library/Preferences/io.github.furcenzo.brewgui.plist",
    "~/Library/Saved Application State/io.github.furcenzo.brewgui.savedState",
  ]

  caveats <<~EOS
    Brew GUI is not notarized by Apple, so macOS may refuse to open it.
    If it does, open System Settings → Privacy & Security and click
    "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Brew GUI.app"
  EOS
end
