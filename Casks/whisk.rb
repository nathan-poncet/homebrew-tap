cask "whisk" do
  version "0.8.1"
  sha256 "f51ca465ef31c6a4f87d400848977365507f6e30a09259948366a65fe06be976"

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
    Whisk is not notarized yet: macOS quarantines the downloaded app and
    refuses to open it on first launch. Clear the flag after installing:
      xattr -d com.apple.quarantine /Applications/Whisk.app

    Direct paste into the previously focused app needs Accessibility
    access (System Settings → Privacy & Security → Accessibility).
  EOS
end
