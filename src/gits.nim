# gits: Run Git commands on several repositories at once
#
# Copyright © 2018 Hugo Locurcio and contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import osproc
import strformat

proc update() =
  var commands: seq[string] = @[]

  # Only one recursion level
  for path in walkDirs("*"):
    if existsDir(&"{path}/.git"):
      commands &= &"git -C {path} pull -v"

    for subpath in walkDirs(&"{path}/*"):
      if existsDir(&"{subpath}/.git"):
        commands &= &"git -C {subpath} pull -v"

  echo &"Updating {commands.len()} repositories…"
  discard execProcesses(commands, {poStdErrToStdOut, poParentStreams}, 100)

when isMainModule:
  update()
