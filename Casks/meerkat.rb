cask "meerkat" do
  version "0.2.0"
  sha256 "703d6d15c2643bc31ef8ef60d86733b6a02509bbbf629da42dbe9a3f9924d669"

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
    "~/Library/Preferences/com.meerkat.app.plist",
    "~/Library/Saved Application State/com.meerkat.app.savedState",
  ]
end
