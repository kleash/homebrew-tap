cask "activiti-modeler" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "1c44dfcfd9342a8cdba7946197abf056845a216be7e2547d517eda3a9ddf6bb0",
         intel: "8e269bff04f291accfb509613dc87d70fc4e5209559c4b93c21934accbebd663"

  url "https://github.com/kleash/activiti-modeler/releases/download/v#{version}/activiti-modeler-#{version}-macos-#{arch}.zip"
  name "Activiti Modeler"
  desc "BPMN and DMN modeler for Activiti, with an embedded engine to run the models"
  homepage "https://github.com/kleash/activiti-modeler"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Activiti Modeler.app"

  uninstall quit: "io.github.kleash.activiti.modeler"

  zap trash: "~/Library/Saved Application State/io.github.kleash.activiti.modeler.savedState"

  caveats <<~EOS
    Your projects are in ~/ActivitiModeler; neither uninstall nor zap deletes them.
  EOS
end
