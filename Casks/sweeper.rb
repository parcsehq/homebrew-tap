cask "sweeper" do
  version "1.3.2"
  sha256 "62c5b5dc0b774455dccca632ad233866a975722006c55e770574d116a3141c38"

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
