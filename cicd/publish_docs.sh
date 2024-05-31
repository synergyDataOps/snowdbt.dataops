#!/bin/bash

git checkout --orphan gh-pages
dbt deps
dbt docs generate --target dev
mv docs tmp_docs
mv target docs
git config --global user.email "github_actions_bot@example.com"
git config --global user.name "github_bot"
git add -f docs
git commit -m "update documentation" docs
git push --force https://$DBT_ENV_SECRET_GIT_TOKEN@github.com/mlegall-ippon/deploy-dbt-github-actions.git 
