cask "airscp" do
  version "2.0.5"
  sha256 "cb3b41f19c259141ca4be0905aab801036f09071c7398eb10bc1fd4ec0bd030c"

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
