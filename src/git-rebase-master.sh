# rebase master if master exists else rebase main

HAS_REMOTE_MASTER=$(git rev-parse --verify master 2>/dev/null)

TARGET_BRANCH="master"

if [ $HAS_REMOTE_MASTER ]; then
    echo "Master exists"
else
    echo "Master does not exist, checking out main"
    TARGET_BRANCH="main"
fi

git rebase -i origin/$TARGET_BRANCH
