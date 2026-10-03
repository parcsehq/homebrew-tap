cask "tray" do
  version "2.0.0"
  sha256 "93f230a6b91b1963157ebc9fd52b561ad2a7d45eaec8840b823989c4ac2af663"

  url "https://releases.parcse.com/tray/#{version}/Tray-#{version}.dmg"
  name "Tray"
  desc "Browse, search, and preview everything Claude Code keeps on your Mac"
  homepage "https://parcse.com/tray"

  livecheck do
    url "https://releases.parcse.com/tray/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Tray.app"

  zap trash: [
    "~/Library/Application Support/com.parcse.tray",
    "~/Library/Caches/com.parcse.tray",
    "~/Library/HTTPStorages/com.parcse.tray",
    "~/Library/Preferences/com.parcse.tray.plist",
    "~/Library/WebKit/com.parcse.tray",
  ]
end
