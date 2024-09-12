# reset master

# rebase master if master exists else rebase main

# stash with a name

current_date=$(date +'%Y-%m-%d')

git stash push -m "stash-before-reset-master$current_date"
git pull

HAS_REMOTE_MASTER=$(git rev-parse --verify master 2>/dev/null)

TARGET_BRANCH="master"

if [ $HAS_REMOTE_MASTER ]; then
    echo "Master exists"
else
    echo "Master does not exist, checking out main"
    TARGET_BRANCH="main"
fi

git reset --hard origin/$TARGET_BRANCH
