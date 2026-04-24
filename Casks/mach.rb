cask "mach" do
  version "0.1.0"
  sha256 "6f3743f505c930ecd08963d95f6a0228e7a0646c4c603a0d23129af5461c8c67"

  url "https://github.com/fauzanazz/mach/releases/download/v#{version}/mach.zip"
  name "mach"
  desc "Mechanical keyboard sounds for your Mac"
  homepage "https://github.com/fauzanazz/mach"

  depends_on macos: ">= :ventura"

  app "mach.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/mach.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/io.mach.app.plist",
    "~/mach-debug.log",
  ]
end
