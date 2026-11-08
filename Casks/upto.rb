cask "upto" do
  version "1.3.1"
  sha256 "c451ae596d04c6105868ea6b1e6b6771d141cec5254ceb7d3d230e3c695475ed"

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
