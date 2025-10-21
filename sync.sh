### Syncing Aliases
echo
echo "Syncing aliases..."

cp -R ~/scripts/aliases/ aliases

rm aliases/aliases-ae.sh

ls -l aliases

### Syncing src
echo
echo "Syncing src..."

cp -R ~/scripts/src .

rm -rf src/sh/verify-user.sh
rm -rf src/python/new-react-component

ls -l src

### Syncing vscode settings
echo
echo "Syncing vscode settings..."

VS_SETTINGS_DIR=./vs-settings

cp ~/Library/Application\ Support/Cursor/User/settings.json $VS_SETTINGS_DIR
cp ~/Library/Application\ Support/Cursor/User/keybindings.json $VS_SETTINGS_DIR

if command -v code >/dev/null 2>&1; then
  code --list-extensions >$VS_SETTINGS_DIR/extensions.txt
fi

if command -v cursor >/dev/null 2>&1; then
  cursor --list-extensions >$VS_SETTINGS_DIR/cursor-extensions.txt
fi

cp -r ~/Library/Application\ Support/Cursor/User/snippets/ $VS_SETTINGS_DIR

### Clean up
search_string="$USER"
replace_string="<your-path>"

# Export LC_ALL to avoid illegal byte sequence errors
export LC_ALL=C

# Use find to locate all files and sed to perform the replacement
find src -type f -exec sed -i '' "s/${search_string}/${replace_string}/g" {} +
find aliases -type f -exec sed -i '' "s/${search_string}/${replace_string}/g" {} +

echo "Sync complete."
