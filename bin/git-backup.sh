#!/bin/bash
git tobranch backup
git add .
git save
git push -f origin $(git current)