cask "airscp" do
  version "2.0.3"
  sha256 "effd3708992ad351feed23c601244da1b15f2cb517ebdc87075aad09b62290e1"

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
