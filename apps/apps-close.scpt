on run SelectedApps
	repeat with MyApp in SelectedApps
	    tell application MyApp
	        quit
        end tell
	
	end repeat
end run
