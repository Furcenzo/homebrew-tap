cask "brew-gui" do
  version "0.4.0"
  sha256 "120016389870bc7fada519a1f065e82d4a32c9e0da1a22a6109cb9b9c50b436c"

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
    Brew GUI is not notarized by Apple, so macOS blocks its first launch.
    Open System Settings → Privacy & Security and click "Open Anyway",
    or run:
      xattr -dr com.apple.quarantine "#{appdir}/Brew GUI.app"
  EOS
end
