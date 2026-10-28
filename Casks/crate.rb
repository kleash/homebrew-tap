cask "crate" do
  version "1.1.1"
  sha256 "01b946822daf0bc5603bc593ae21ec31caba598fee8bbabcadde8593117509df"

  url "https://github.com/kleash/crate/releases/download/v#{version}/Crate-#{version}.zip"
  name "Crate"
  desc "Browse, preview, extract and create ZIP, 7-Zip, RAR and TAR archives"
  homepage "https://github.com/kleash/crate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Crate.app"

  uninstall quit: "com.kleash.crate"

  zap trash: [
    "~/Library/Containers/com.kleash.crate.quicklook",
    "~/Library/Saved Application State/com.kleash.crate.savedState",
  ]
end
