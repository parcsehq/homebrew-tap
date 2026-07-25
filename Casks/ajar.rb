cask "ajar" do
  version "1.2.1"
  sha256 "e1fd3dc4e24a014f20230c71e2e56200c4e47a87221ba88ab359fb5dda1a2b66"

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
