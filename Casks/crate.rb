cask "crate" do
  version "1.1.0"
  sha256 "5bb5f1952a3d809cf2e29fac84bd45be349398259dbe0d34d3a7014b4b7131fa"

  url "https://github.com/kleash/crate/releases/download/v#{version}/Crate-#{version}.zip"
  name "Crate"
  desc "Browse, preview, extract and create ZIP, 7-Zip, RAR and TAR archives"
  homepage "https://github.com/kleash/crate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Crate/Crate.app"

  # Crate is ad-hoc signed: macOS calls a quarantined copy "damaged". Registering Services and Quick Look now
  # saves a first launch; macOS also does it then, so those may fail.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Crate.app"],
                          writable_paths: ["Crate.app"], writable_base: :appdir
    run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
        args: ["-f", "-R", "{{appdir}}/Crate.app"], must_succeed: false
    run "/usr/bin/pluginkit",
        args: ["-a", "{{appdir}}/Crate.app/Contents/PlugIns/CrateQuickLook.appex"], must_succeed: false
    run "/usr/bin/pluginkit", args: ["-e", "use", "-i", "com.kleash.crate.quicklook"], must_succeed: false
    run "/System/Library/CoreServices/pbs", args: ["-update"], must_succeed: false
  end

  uninstall quit: "com.kleash.crate"

  zap trash: [
    "~/Library/Containers/com.kleash.crate.quicklook",
    "~/Library/Saved Application State/com.kleash.crate.savedState",
  ]
end
