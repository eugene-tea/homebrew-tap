cask "stage-manager" do
  version "1.8.3"
  sha256 "fa05afb10214148543c7f6fc0e9d692b9bab57d0577e0dc8bf0590c247423a6d"

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
