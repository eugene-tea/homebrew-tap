cask "stage-manager" do
  version "1.3.0"
  sha256 "40dfcf95c6489d00ca1116045b561a83963403be430703c6b1ae2be4a724c284"

  url "https://github.com/eugene-tea/stage-manager/releases/download/v#{version}/Stage-Manager.dmg"
  name "Stage Manager"
  desc "Floating-window stage manager with rules, named stages and hotkeys"
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
