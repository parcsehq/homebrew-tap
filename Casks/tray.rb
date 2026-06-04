cask "tray" do
  version "1.0.2"
  sha256 "6da6b444d035d231f7a4efc38985f90249802389914366b8d7461d2b04a3fdf9"

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
