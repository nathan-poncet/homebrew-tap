class Whisk < Formula
  desc "Clipboard manager for macOS with a Liquid Glass panel"
  homepage "https://github.com/nathan-poncet/whisk"
  url "https://github.com/nathan-poncet/whisk/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1edf15939a83609b824a971ea0bf3dfc405d42d6619b8ea518cec7b531665afa"
  license "MIT"
  head "https://github.com/nathan-poncet/whisk.git", branch: "main"

  depends_on macos: :tahoe

  def install
    system "./scripts/build-app.sh", version.to_s, "native"
    prefix.install "dist/Whisk.app"
    (bin/"whisk").write <<~SCRIPT
      #!/bin/bash
      exec open "#{prefix}/Whisk.app" "$@"
    SCRIPT
  end

  def caveats
    <<~EOS
      Whisk.app was installed to:
        #{prefix}/Whisk.app

      Launch it with `whisk`, then press ⇧⌘V. To have it in Launchpad:
        ln -sf "#{prefix}/Whisk.app" /Applications/Whisk.app

      Direct paste into the previously focused app needs Accessibility
      access (System Settings → Privacy & Security → Accessibility).
    EOS
  end

  test do
    assert_predicate prefix/"Whisk.app/Contents/MacOS/Whisk", :exist?
  end
end
