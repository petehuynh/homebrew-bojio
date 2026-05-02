cask "bojio-edge" do
  version "0.1.0"
  sha256 "a2d249894f48ce817fed464b5e57847cf62ee8eb75c180bc4acf0a9fc4b0b6d3"

  url "https://bojio.net/aetheria/edge/download/Bojio-Edge_#{version}_aarch64.dmg",
      header: "Authorization: Bearer #{ENV.fetch('AETHER_TOKEN', '')}"
  name "Bojio-Edge"
  desc "Distributed LLM inference node for the Aetheria network"
  homepage "https://bojio.net"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Bojio-Edge.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Bojio-Edge.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/net.bojio.edge",
    "~/Library/Caches/net.bojio.edge",
    "~/Library/Preferences/net.bojio.edge.plist",
    "~/Library/Saved Application State/net.bojio.edge.savedState",
  ]
end
