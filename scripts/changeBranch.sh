#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: $0 <branch>"
    exit 1
fi

BRANCH_NAME=$1

echo "Checking out branch $BRANCH_NAME for wings submodule..."
cd wings
git checkout $BRANCH_NAME
cd ..

echo "Dele old wings-dev directory..."
rm -rf wings-dev

echo "Updating .gitmodules to point to $BRANCH_NAME..."
# sed -i "s|branch = .*|branch = $BRANCH_NAME|g" .gitmodules
git config -f .gitmodules submodule.\wings.branch $BRANCH_NAME
git config -f .git/config submodule.\wings.branch $BRANCH_NAME

git add .gitmodules

echo "Updating wings-dev submodule..."

echo "Done!"