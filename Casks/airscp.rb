cask "airscp" do
  version "1.0.0"
  sha256 "bb6d49b2503718df63d42a1d6222a585c150bf2dad04915adadd772d9ae0faae"

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
