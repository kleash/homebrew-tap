cask "airscp" do
  version "1.2.0"
  sha256 "67affd05add2a11757b2d128c1f5850c7f5a8c200a27a4d3228a5c178b606745"

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
    AirSCP isn't notarized yet. The first time you open it, macOS says it can't check it:
    click Done, then System Settings > Privacy & Security > Open Anyway.
    https://kleash.github.io/airscp/getting-started/install.html
  EOS
end
