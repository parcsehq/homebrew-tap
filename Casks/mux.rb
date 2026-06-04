cask "mux" do
  version "1.3.6"
  sha256 "725c888cdc5f9c09123bb4632f0b593f0d0ef7103b0d0f3cac4022bfb1e6d6c7"

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
