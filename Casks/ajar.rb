cask "ajar" do
  version "1.2.0"
  sha256 "061cc482a7cdc91370ac93ed98a54c5528efb88de7ebfa6036bcfbb00944bb48"

  url "https://releases.parcse.com/ajar/#{version}/Ajar-#{version}.dmg"
  name "Ajar"
  desc "Sync brightness and backlight to lid angle, keep Mac awake for AI agents"
  homepage "https://parcse.com/ajar"

  livecheck do
    url "https://releases.parcse.com/ajar/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Ajar.app"

  zap trash: [
    "~/Library/Application Support/com.parcse.ajar",
    "~/Library/Caches/com.parcse.ajar",
    "~/Library/HTTPStorages/com.parcse.ajar",
    "~/Library/Preferences/com.parcse.ajar.plist",
    "~/Library/WebKit/com.parcse.ajar",
  ]
end
