# homebrew-tap

Personal [Homebrew](https://brew.sh) tap.

```sh
brew install --cask nathan-poncet/tap/whisk
xattr -d com.apple.quarantine /Applications/Whisk.app
```

| Cask | Description |
| --- | --- |
| [`whisk`](Casks/whisk.rb) | Clipboard manager for macOS with a Liquid Glass panel — [nathan-poncet/whisk](https://github.com/nathan-poncet/whisk) |

Casks are bumped automatically by each project's release workflow.
(The `xattr` step is only needed until Whisk ships notarized builds.)
