cask "looq@beta" do
  version "2.0.0-beta.73"
  sha256 "a3adc0338629bc7500e869e47f5c0c0bf93e05c0064f6bfb5e136e448edff3e7"

  url "https://releases.parcse.com/looq/#{version}/Looq-#{version}.dmg"
  name "Looq"
  desc "Quick Look for Markdown, code, SQLite, TSV, archives, folders, metadata, and more"
  homepage "https://parcse.com/looq"

  livecheck do
    url "https://releases.parcse.com/looq/appcast.xml"
    # A beta item published since the version carries the channel and build has
    # shortVersionString <short>-beta.<build>, which is the artifact path too.
    # Earlier beta items keep the stable shortVersionString and carry the build
    # in sparkle:version alone, so the path is composed from both.
    strategy :sparkle do |items|
      item = items.find { |candidate| candidate.channel == "beta" }
      next if item.nil?

      item.short_version.include?("-beta.") ? item.short_version : "#{item.short_version}-beta.#{item.version}"
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
