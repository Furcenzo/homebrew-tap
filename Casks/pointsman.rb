cask "pointsman" do
  version "0.1.0"
  sha256 "598dbfcaf69dc749c25bacfeca785c2057261ff4b9b6c497d85f5e8f85c649ff"

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
