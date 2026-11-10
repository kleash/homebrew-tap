cask "airscp" do
  version "2.0.7"
  sha256 "70551221fc0b7ab730a7d38f30f0d6847fce8939c36be4b4f6b55e220b6e8604"

  url "https://github.com/kleash/airscp/releases/download/v#{version}/AirSCP-#{version}.zip"
  name "AirSCP"
  desc "SCP and SFTP client with a two-pane browser and Remote Desktop"
  homepage "https://kleash.github.io/airscp/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "AirSCP.app"

  zap trash: [
    "~/Library/Application Support/AirSCP",
    "~/Library/Preferences/com.kleash.airscp.plist",
    "~/Library/Saved Application State/com.kleash.airscp.savedState",
  ]
end
