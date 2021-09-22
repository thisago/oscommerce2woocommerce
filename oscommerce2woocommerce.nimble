# Package

version       = "0.1.1"
author        = "Thiago Navarro"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"

binDir = "build"
bin = @["oscommerce2woocommerce"]

# Dependencies

requires "nim >= 1.5.1"
requires "cligen >= 1.5.15"
requires "jsony >= 1.0.4"

task buildRelease, "Build the release version":
  exec "nimble -d:release build"
