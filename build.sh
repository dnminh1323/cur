#!/bin/bash

# rsrc: go install github.com/akavel/rsrc@latest
rsrc -arch amd64 -ico rsrc.ico -o rsrc.syso;
GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -ldflags "-s -w" -o build/cursor-vip_windows_amd64.exe;
rm rsrc.syso;



chmod +x build/install.sh;
chmod +x build/cursor-vip_windows_amd64.exe;
