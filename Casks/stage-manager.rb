cask "stage-manager" do
  version "1.8.1"
  sha256 "f892c401518aeee4854a9b3ad22ab7438f8052647486b3861eeec3f9e319cdaa"

  url "https://github.com/eugene-tea/stage-manager/releases/download/v#{version}/Stage-Manager.dmg"
  name "Stage Manager"
  desc "Works like Apple's Stage Manager, and keeps stages across restarts"
  homepage "https://eugene-tea.github.io/stage-manager/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Stage Manager.app"
  binary "#{appdir}/Stage Manager.app/Contents/MacOS/stage-manager"

  uninstall quit: "dev.eugene.stagemanager"

  zap trash: [
    "~/.config/stage-manager",
    "~/Library/Logs/Stage Manager",
    "~/Library/Preferences/dev.eugene.stagemanager.plist",
    "~/Library/Saved Application State/dev.eugene.stagemanager.savedState",
  ]
end
