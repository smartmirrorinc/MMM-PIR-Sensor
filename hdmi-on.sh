#!/bin/bash

# Helper script to turn on HDMI output with Raspberry Pi 4 workarounds

# Requires sudoers to be set up such that the user running this script can call chvt with 
# superuser permissions and no password. Example contents of /etc/sudoers.d/chvt:
# pi smartmirror-pi = (root) NOPASSWD: /bin/chvt

# Power on HDMI with preferred settings
tvservice -p
# Seems that HDMI powers on just fine with tvservice -p, but there's no picture. Workaround:

# Dummy fbset setting depth to the same as it already is. This gives us HDMI output from tty1,
# but tty7 has focus (keyboard input goes to tty7 and switching to it does nothing)
fbset -depth 32

# ... then switch to tty1 so it actually has focus, then to tty7 to get our desired GUI.
sudo chvt 1
sudo chvt 7
