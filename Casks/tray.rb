cask "tray" do
  version "2.1.0"
  sha256 "64e79e0401f0f174d99f6dbb32ee0be285d2076b66b291b882aba9b8b28edc6a"

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
