on run SelectedApps
	repeat with MyApp in SelectedApps
		tell application MyApp
			tell application "System Events" to tell process MyApp
				set myWindowsCount to count of windows
			
				set counter to 0
			
				repeat myWindowsCount times
					set counter to counter + 1
					set value of attribute "AXFullScreen" of window counter to true
				end repeat
			end tell
		end tell
	end repeat
end run