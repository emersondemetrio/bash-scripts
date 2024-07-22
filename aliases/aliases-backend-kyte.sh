# Define the function
ruff_diff() {
    # Get the list of changed files
    local changed_files=$(git diff --name-only)

    # Check if there are any changed files
    if [[ -z "$changed_files" ]]; then
        echo "No changed files found."
        return 0
    fi

    # Loop through each changed file and run ruff
    while IFS= read -r file; do
        if [[ -f $file ]]; then
            ruff format "$file"
        else
            echo "File $file not found, skipping..."
        fi
    done <<<"$changed_files"
}
# Create an alias for the function
alias ruff-diff='ruff_diff'

ruff_list() {
    if [[ ! -f $1 ]]; then
        echo "File $1 not found!"
        exit 1
    fi

    # Read each line from $1 and run ruff command
    while IFS= read -r file; do
        if [[ -f $file ]]; then
            ruff format "$file"
        else
            echo "File $file not found, skipping..."
        fi
    done <$1
}

alias ruff-list='ruff_list'
