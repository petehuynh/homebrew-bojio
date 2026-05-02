cask "aether" do
  version "0.3.1"
  sha256 "9640a2efe8000db9e40928332dfe18fc914a40674c4f2b1cc5d92d8fb428643e"

  url "https://goaether.net/node/download/Aether_#{version}_aarch64.dmg",
      header: "Authorization: Bearer #{ENV.fetch('AETHER_TOKEN', '')}"
  name "Aether"
  desc "Household AI — run open language models on your Mac and share over Wi-Fi"
  homepage "https://goaether.net"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Aether.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Aether.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.petehuynh.aether",
    "~/Library/Caches/com.petehuynh.aether",
    "~/Library/Preferences/com.petehuynh.aether.plist",
    "~/Library/Saved Application State/com.petehuynh.aether.savedState",
  ]
end
