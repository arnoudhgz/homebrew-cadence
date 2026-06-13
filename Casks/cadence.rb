cask "cadence" do
  version "0.2.0"
  sha256 "2c8cd41bbf51b7c6301ab9b2dcfa70a043150ba370de16068229b23f49ed6ff6"

  url "https://github.com/arnoudhgz/cadence/releases/download/v#{version}/Cadence.zip"
  name "Cadence"
  desc "Unofficial YouTube Music player"
  homepage "https://github.com/arnoudhgz/cadence"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Cadence.app"

  # Cadence is adhoc-signed (not yet Apple Developer ID notarized). Homebrew
  # dropped the `--no-quarantine` flag, so strip the quarantine xattr here
  # to give users a frictionless first launch. Remove once a notarized build
  # ships.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cadence.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Cadence",
    "~/Library/Caches/com.arnoudhgz.Cadence",
    "~/Library/Preferences/com.arnoudhgz.Cadence.plist",
    "~/Library/Saved Application State/com.arnoudhgz.Cadence.savedState",
    "~/Library/WebKit/com.arnoudhgz.Cadence",
  ]
end
