cask "tray" do
  version "1.1.1"
  sha256 "341ea52de00586647a6c4c3912f3a3bee59ddec5cbb8ed92fe779f4b89e0ee15"

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
