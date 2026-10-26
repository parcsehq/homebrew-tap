cask "ajar" do
  version "1.3.0"
  sha256 "2012338a96eee1f36aee6e85e5a542312d812b2c8beecaedec157998e99c24ee"

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
