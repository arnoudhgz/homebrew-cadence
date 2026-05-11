cask "cadence" do
  version "0.1.0"
  sha256 "eb04fc6ca9a1e236901331a55a96a5a614966643cb0ff21956b95f4ac1f0a318"

  url "https://github.com/arnoudhgz/cadence/releases/download/#{version}/Cadence.zip"
  name "Cadence"
  desc "Unofficial YouTube Music player"
  homepage "https://github.com/arnoudhgz/cadence"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

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
