cask "whisk" do
  version "0.7.15"
  sha256 "3ac5e108d58b7c6778b5e053f71caa79440174d518c0bbfec1629d14ef93c612"

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
