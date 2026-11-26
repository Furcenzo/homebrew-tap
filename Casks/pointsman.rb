cask "pointsman" do
  version "0.1.1"
  sha256 "c9e17e79c4d5a397550905a85422437473eb0e159dc166678a1a7da334ccfdaf"

  url "https://github.com/Furcenzo/pointsman/releases/download/v#{version}/Pointsman-#{version}.zip"
  name "Pointsman"
  desc "Menu bar switcher between installed releases and development builds of your apps"
  homepage "https://github.com/Furcenzo/pointsman"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Pointsman.app"

  uninstall quit: "io.github.furcenzo.pointsman"

  zap trash: [
    "~/Library/Application Support/Pointsman",
    "~/Library/Caches/Pointsman",
    "~/Library/Preferences/io.github.furcenzo.pointsman.plist",
  ]

  caveats <<~EOS
    Pointsman is not notarized by Apple, so macOS may refuse to open it.
    If it does, open System Settings → Privacy & Security and click
    "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Pointsman.app"
  EOS
end
