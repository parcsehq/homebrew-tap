cask "mux" do
  version "1.4.0"
  sha256 "f4cf0167eee0076565c1fef0b60d5f28e26dc390e178ee66c147e8b1c914e3b4"

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
