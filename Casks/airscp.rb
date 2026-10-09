cask "airscp" do
  version "1.1.0"
  sha256 "dc6ba9c734084acc22e7c878fa390d56d26bee2167edeb71705e87a0cc3d2c2c"

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

  caveats <<~EOS
    AirSCP 1.0.0 isn't notarized yet. The first time you open it, macOS says it can't check it:
    click Done, then System Settings > Privacy & Security > Open Anyway.
    https://kleash.github.io/airscp/getting-started/install.html
  EOS
end
