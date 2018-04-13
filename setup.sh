#!/usr/bin/env bash

test $(uname -s) == 'Darwin' || abort

cp bin/screencaprn /usr/local/bin/screencaprn

cat<<EOF>~/Library/LaunchAgents/usr.screenshot.rename.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>usr.screenshot.rename</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>-c</string>
        <string>/usr/local/bin/screencaprn</string>
    </array>
    <key>WatchPaths</key>
    <array>
        <string>$HOME/Desktop</string>
    </array>
</dict>
</plist>
EOF

launchctl load ~/Library/LaunchAgents/usr.screenshot.rename.plist
