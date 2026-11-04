cask "airsql" do
  version "1.0.1"
  sha256 "8068a64631c320daa365f887b4ea992b30fab6bd402233cc494c086e79a67d5e"

  url "https://github.com/kleash/airsql/releases/download/v#{version}/AirSQL-#{version}.zip"
  name "AirSQL"
  desc "MySQL and MariaDB client with SSH tunnels, a data grid and schema tools"
  homepage "https://kleash.github.io/airsql/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "AirSQL.app"

  zap trash: [
    "~/Library/Application Support/AirSQL",
    "~/Library/Preferences/com.kleash.airsql.plist",
    "~/Library/Saved Application State/com.kleash.airsql.savedState",
  ]
end
