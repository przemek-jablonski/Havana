XCODE_USER_TEMPLATES_DIR=~/Library/Developer/Xcode/Templates/File\ Templates
XCODE_USER_SNIPPETS_DIR=~/Library/Developer/Xcode/UserData/CodeSnippets

PROJECT_TEMPLATES_DIR_NAME=Havana

install:
	mkdir -p $(XCODE_USER_TEMPLATES_DIR) # create custom templates directory, if doesn't exist already
	rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(PROJECT_TEMPLATES_DIR_NAME) # remove all stale project templates
	cp -R Templates $(XCODE_USER_TEMPLATES_DIR)/$(PROJECT_TEMPLATES_DIR_NAME) # copy over all new project templates
	defaults write com.apple.dt.Xcode IDEAdditionalCounterpartSuffixes -array-add "View" "Reducer" # register associated types with xcode