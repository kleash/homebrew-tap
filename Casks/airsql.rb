cask "airsql" do
  version "1.1.1"
  sha256 "74bf37b4028d5abe337200cfaf5beb326884102bbaa29ceec47cf278de5bbd5f"

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
