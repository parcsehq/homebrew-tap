cask "upto" do
  version "1.4.0"
  sha256 "7a935064743e5db1b4ddd13e07efce75b7307354e97691dfeac21088fbe66140"

  url "https://releases.parcse.com/upto/#{version}/Upto-#{version}.dmg"
  name "Upto"
  desc "Find, check, and install updates for every app"
  homepage "https://macupto.com/"

  livecheck do
    url "https://releases.parcse.com/upto/appcast.xml"
    # The appcast can also carry beta items under sparkle:channel; the Sparkle
    # strategy does not filter by channel on its own, so pick the newest
    # default-channel item explicitly.
    strategy :sparkle do |items|
      items.find { |item| item.channel.nil? }&.short_version
    end
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Upto.app"

  zap trash: [
    "~/Library/Caches/com.parcse.upto",
    "~/Library/HTTPStorages/com.parcse.upto",
    "~/Library/HTTPStorages/com.parcse.upto.binarycookies",
    "~/Library/Preferences/com.parcse.upto.plist",
    "~/Library/WebKit/com.parcse.upto",
  ]
end
