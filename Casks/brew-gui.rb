cask "brew-gui" do
  version "0.3.1"
  sha256 "53a71dc20a90f9b561c05967b4331a92baf473f7dfac6f50546746c960d7cf6a"

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
