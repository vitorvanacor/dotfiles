#!/bin/bash
git br backup
git add .
git save
git push -f origin $(git current)