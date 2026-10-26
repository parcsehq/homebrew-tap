cask "looq@beta" do
  version "2.0.0-beta.68"
  sha256 "5da3013e7e7e9ae1024793310741971f96cb168e1e2c8d8670342f9d6088c539"

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
