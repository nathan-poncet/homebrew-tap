cask "whisk" do
  version "1.0.7"
  sha256 "291d02ea4295715f841c5dc7c53315c012acf31610502e0e040536d5a01b5e8d"

  url "https://github.com/nathan-poncet/whisk/releases/download/v#{version}/Whisk.dmg"
  name "Whisk"
  desc "Clipboard manager for macOS with a Liquid Glass panel"
  homepage "https://nathan-poncet.github.io/whisk/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Whisk.app"

  zap trash: [
    "~/Library/Application Support/Whisk",
    "~/Library/Preferences/com.nathanponcet.whisk.plist",
  ]

  caveats <<~EOS
    Direct paste into the previously focused app needs Accessibility
    access (System Settings → Privacy & Security → Accessibility).
  EOS
end
