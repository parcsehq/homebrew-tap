cask "sweeper" do
  version "1.6.0"
  sha256 "8c04ffb781bbf318336502dfd51afbe15585de0e1890a5822822500b13b31909"

  url "https://releases.parcse.com/sweeper/#{version}/Sweeper-#{version}.dmg"
  name "Sweeper"
  desc "Uninstall apps cleanly, find orphaned files, and manage login items"
  homepage "https://parcse.com/sweeper"

  livecheck do
    url "https://releases.parcse.com/sweeper/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Sweeper.app"

  zap trash: [
    "~/Library/Application Support/com.parcse.sweeper",
    "~/Library/Caches/com.parcse.sweeper",
    "~/Library/HTTPStorages/com.parcse.sweeper",
    "~/Library/Preferences/com.parcse.sweeper.plist",
    "~/Library/Saved Application State/com.parcse.sweeper.savedState",
  ]
end
