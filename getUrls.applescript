#!/usr/bin/osascript


-- This AppleScript gets default browser tabs and prints them to text file

-- Set directory to project directory
set bookmarkFolder to do shell script "pwd"
set username to do shell script "whoami"
set defaultFolder to POSIX file (bookmarkFolder)

-- Initialize URL text file
set cmd to "# URLs for Project context" & linefeed & linefeed

-- Write urls to file: Change "Safari" to preferred browser
tell application "Safari"
    set n to count of tabs in front window
    repeat with i from 1 to n
        set cmd to cmd & URL of tab i of front window & linefeed
    end repeat
end tell

-- Open and save file
tell me
    activate
    set scriptAlias to choose file name default name "bkmrks" default location (defaultFolder as alias)
end tell

set scriptPath to quoted form of POSIX path of scriptAlias
set scriptFile to open for access scriptAlias with write permission
set eof scriptFile to 0
write cmd to scriptFile starting at eof
close access scriptFile
