cask "whisk" do
  version "1.0.3"
  sha256 "b5bba1bf2f9356a351d5528096642b2fb3738ead3333fa0ebd2e094051cddc21"

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
