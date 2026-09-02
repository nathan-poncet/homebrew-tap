cask "whisk" do
  version "0.7.5"
  sha256 "4fe6663152897c69884d00a11dc73666de5a83e738fb91ce9a344ce97d9ea213"

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
