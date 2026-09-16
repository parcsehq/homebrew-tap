cask "looq@beta" do
  version "1.7.5-beta.60"
  sha256 "f350eb6d0f231b80dedec40fe2dba429c9f693bb6183928ac825ddfd3f067965"

  url "https://releases.parcse.com/looq/#{version}/Looq-#{version}.dmg"
  name "Looq"
  desc "Quick Look for Markdown, code, SQLite, TSV, archives, folders, metadata, and more"
  homepage "https://parcse.com/looq"

  livecheck do
    url "https://releases.parcse.com/looq/appcast.xml"
    # Beta items keep the stable shortVersionString and carry the build in
    # sparkle:version; the artifact path is <short>-beta.<build>.
    strategy :sparkle do |items|
      item = items.find { |candidate| candidate.channel == "beta" }
      next if item.nil?

      "#{item.short_version}-beta.#{item.version}"
    end
  end

  auto_updates true
  conflicts_with cask: "looq"
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
