cask "stowaway" do
  version "0.1.3"
  sha256 "62378afde57200bcf9db7a5922916618424e21fd47a4f978f7bafd553fba41ab"

  url "https://github.com/Furcenzo/stowaway/releases/download/v#{version}/Stowaway-#{version}.zip"
  name "Stowaway"
  desc "Menu bar manager: hide menu bar icons and open them from a bar"
  homepage "https://github.com/Furcenzo/stowaway"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :golden_gate

  app "Stowaway.app"

  # Quitting Stowaway brings every hidden menu bar icon back.
  uninstall quit: "io.github.furcenzo.stowaway"

  zap trash: "~/Library/Preferences/io.github.furcenzo.stowaway.plist"

  caveats <<~EOS
    Stowaway must run from #{appdir}, otherwise macOS hides its own icon too.
    It asks for Accessibility on the first start and hides nothing until it's allowed.

    Stowaway is not notarized by Apple, so macOS may refuse to open it.
    If it does, open System Settings → Privacy & Security and click
    "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Stowaway.app"
  EOS
end
