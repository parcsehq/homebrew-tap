cask "sweeper" do
  version "1.5.0"
  sha256 "76bfcdef33e2eaab077169eae04fbb3c0ff30ce1ef6a8bfd7a4c2054ebbfa9b8"

  url "https://releases.parcse.com/sweeper/#{version}/Sweeper-#{version}.dmg"
  name "Sweeper"
  desc "Uninstall apps cleanly, find orphaned files, and manage login items"
  homepage "https://parcse.com/sweeper"

  livecheck do
    url "https://releases.parcse.com/sweeper/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Sweeper.app"

  zap trash: [
    "~/Library/Application Support/com.parcse.sweeper",
    "~/Library/Caches/com.parcse.sweeper",
    "~/Library/HTTPStorages/com.parcse.sweeper",
    "~/Library/Preferences/com.parcse.sweeper.plist",
    "~/Library/Saved Application State/com.parcse.sweeper.savedState",
  ]
end
