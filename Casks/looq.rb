cask "looq" do
  version "1.7.3"
  sha256 "d941126b735ed4df0ab98ad3800deef6eed004241984df0bb1eccaff69a4974c"

  url "https://releases.parcse.com/looq/#{version}/Looq-#{version}.dmg"
  name "Looq"
  desc "Quick Look for Markdown, code, SQLite, TSV, archives, folders, metadata, and more"
  homepage "https://parcse.com/looq"

  livecheck do
    url "https://releases.parcse.com/looq/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Looq.app"

  zap trash: [
    "~/Library/Application Support/com.parcse.looq",
    "~/Library/Caches/com.parcse.looq",
    "~/Library/Containers/com.parcse.looq.LooqQuickLook",
    "~/Library/Group Containers/group.com.parcse.looq",
    "~/Library/HTTPStorages/com.parcse.looq",
    "~/Library/Preferences/com.parcse.looq.plist",
    "~/Library/Preferences/group.com.parcse.looq.plist",
    "~/Library/Saved Application State/com.parcse.looq.savedState",
    "~/Library/WebKit/com.parcse.looq",
  ]
end
