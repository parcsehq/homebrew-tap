cask "mux" do
  version "1.3.7"
  sha256 "fff6448e968fd51a52fa0e34affbd785305f1819ef8096b494531b2f264b3db5"

  url "https://releases.parcse.com/mux/#{version}/Mux-#{version}.dmg"
  name "Mux"
  desc "Automatic priority-based switching between Wi-Fi and Ethernet"
  homepage "https://parcse.com/mux"

  livecheck do
    url "https://releases.parcse.com/mux/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Mux.app"

  zap trash: [
    "~/Library/Application Support/com.parcse.mux",
    "~/Library/Caches/com.parcse.mux",
    "~/Library/HTTPStorages/com.parcse.mux",
    "~/Library/Preferences/com.parcse.mux.plist",
    "~/Library/WebKit/com.parcse.mux",
  ]
end
