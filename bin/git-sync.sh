#!/bin/bash
git pull --rebase origin $(git current)
git push origin $(git current)