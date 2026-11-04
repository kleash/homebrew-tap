cask "airscp" do
  version "2.0.0"
  sha256 "b0b56edf1693044e6f802da138fa61f79b44c7262bd0784269c5753af0ba6c14"

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
