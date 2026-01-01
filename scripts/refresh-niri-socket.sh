#!/usr/bin/env bash

export NIRI_SOCKET="$(\ls /run/user/$(id --user)/niri*)"
