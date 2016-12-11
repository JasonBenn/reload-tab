#!/usr/bin/env bash

osascript -e "
  tell application \"Google Chrome\"
  activate
  set theUrl to \"$1\"
  set found to false
  set windowList to every window
  repeat with aWindow in windowList
    set tabList to every tab of aWindow
    set tabIndex to 0
    repeat with atab in tabList
      set tabIndex to tabIndex + 1
      if (URL of atab contains theUrl) then
        set found to true
        tell atab to reload
        set aWindow's active tab index to tabIndex
      end if
    end repeat
  end repeat
  if not found then
    open location theUrl
  end if
end tell"
