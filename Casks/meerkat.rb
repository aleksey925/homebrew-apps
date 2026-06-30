cask "meerkat" do
  version "0.3.0"
  sha256 "b953aecf89a618606b43547b6be1ae924427baca4eeb1b8f8980e3348a43f05f"

  url "https://github.com/aleksey925/meerkat/releases/download/v#{version}/Meerkat_#{version}_aarch64.dmg"
  name "Meerkat"
  desc "macOS menubar app for tracking GitLab merge requests"
  homepage "https://github.com/aleksey925/meerkat"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Meerkat.app"

  # app is unsigned; strip the quarantine flag so Gatekeeper does not block
  # launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Meerkat.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.meerkat.app",
    "~/Library/LaunchAgents/Meerkat.plist",
    "~/Library/Preferences/com.meerkat.app.plist",
    "~/Library/Saved Application State/com.meerkat.app.savedState",
  ]
end
