### Syncing Aliases
echo
echo "Syncing aliases"

cp -R ~/scripts/aliases/ aliases

rm aliases/aliases-kyte.sh
rm aliases/aliases-ops-tooling.sh
rm aliases/aliases-surfer.sh
rm aliases/aliases-flaggr.sh
rm aliases/aliases-fleet.sh

ls aliases

### Syncing src
echo
echo "Syncing src"

cp -R ~/scripts/src .

rm -rf src/verify-user.sh
rm -rf src/new-react-component
rm src/open-fleet*
rm src/new_branch.sh
rm src/random-pass.py
rm src/start-all.sh
rm src/open-issue.sh
rm src/get-merge-request.py

ls src

### Syncing vscode settings
echo "Syncing vscode settings"

VS_SETTINGS_DIR=./vs-settings

cp ~/Library/Application\ Support/Code/User/settings.json $VS_SETTINGS_DIR
cp ~/Library/Application\ Support/Code/User/keybindings.json $VS_SETTINGS_DIR
code --list-extensions >$VS_SETTINGS_DIR/extensions.txt
cp -r ~/Library/Application\ Support/Code/User/snippets/ $VS_SETTINGS_DIR

### Clean up
search_string="emersondemetrio"
replace_string="<your-path>"

# Export LC_ALL to avoid illegal byte sequence errors
export LC_ALL=C

# Use find to locate all files and sed to perform the replacement
find src -type f -exec sed -i '' "s/${search_string}/${replace_string}/g" {} +
find aliases -type f -exec sed -i '' "s/${search_string}/${replace_string}/g" {} +

echo "Sync complete."
