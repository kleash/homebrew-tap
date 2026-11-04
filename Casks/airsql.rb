cask "airsql" do
  version "1.0.0"
  sha256 "fde76b15843794f6543759aead96c8d9d8967a3c22271d3ef64a3f69432febd3"

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
