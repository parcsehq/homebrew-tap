cask "ajar" do
  version "1.2.1"
  sha256 "b9c61af54698368da884714b7c6c8e441b2e595f270aba4ef6eee52ff2a7a23b"

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
