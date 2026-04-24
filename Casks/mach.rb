cask "mach" do
  version "0.1.1"
  sha256 "ea71fc421d9d3169322d75e2deed303c8cb7d70b1094dafacbbc36724433c21c"

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
