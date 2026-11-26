cask "upto" do
  version "1.4.2"
  sha256 "02b44954c5c9cfdbfb88c4de743df1233c12336590d3fdf31ebc3311c5761246"

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
