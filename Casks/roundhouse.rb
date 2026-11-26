cask "roundhouse" do
  version "0.2.0"
  sha256 "b2adfa82d1315a3dddb0d4b371582ae3553375bdcd1217f19f73e67b4ce49c61"

  url "https://github.com/Furcenzo/roundhouse/releases/download/v#{version}/Roundhouse-#{version}.zip"
  name "Roundhouse"
  desc "Connection launcher for SSH, RDP, VNC, web interfaces and WinBox"
  homepage "https://github.com/Furcenzo/roundhouse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Roundhouse.app"

  # Roundhouse keeps running in the background for its global shortcut.
  uninstall quit: "io.github.furcenzo.roundhouse"

  zap trash: [
    "~/Library/Application Support/Roundhouse",
    "~/Library/Preferences/io.github.furcenzo.roundhouse.plist",
  ]

  caveats <<~EOS
    Roundhouse has no Dock icon by default: press ⌥Space for the search panel,
    or open Roundhouse again for the connection list.

    Roundhouse is not notarized by Apple, so macOS may refuse to open it.
    If it does, open System Settings → Privacy & Security and click
    "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Roundhouse.app"
  EOS
end
