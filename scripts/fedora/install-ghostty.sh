#!/usr/bin/env bash
set -e
sudo dnf copr enable scottames/ghostty -y
sudo dnf install -y ghostty
