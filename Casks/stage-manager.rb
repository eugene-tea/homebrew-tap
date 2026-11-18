cask "stage-manager" do
  version "1.9.1"
  sha256 "c328556f0fb433bde1d2ea0ee4b5dd972ddd0b8aeb6d79c708279ed8c07c6069"

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
