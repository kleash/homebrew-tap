cask "airsql" do
  version "1.1.0"
  sha256 "a40e48a21ba702a32f9df10dd4de66285b73b39bbe912e10b79f7b3a8ec2b955"

  url "https://github.com/kleash/airsql/releases/download/v#{version}/AirSQL-#{version}.zip"
  name "AirSQL"
  desc "MySQL, MariaDB and MongoDB client with SSH tunnels and visual query builders"
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
