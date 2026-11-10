cask "airsql" do
  version "1.0.2"
  sha256 "756937f42936e337fb92faf7440d65b5f8c8c01d6c4ac5a1f931990419a9611e"

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
