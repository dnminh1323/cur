#!/bin/bash
# garble 混淆安装: go install mvdan.cc/garble@latest
# rsrc 应用程序图标安装: go install github.com/akavel/rsrc@latest

# Tạo thư mục build nếu chưa tồn tại
mkdir -p build

# Tạo file rsrc.syso với biểu tượng (icon)
rsrc -arch amd64 -ico rsrc.ico -o rsrc.syso
GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -ldflags "-s -w" -o build/cursor-vip_windows_amd64.exe
rm rsrc.syso

rsrc -arch arm -ico rsrc.ico -o rsrc.syso
GOOS=windows GOARCH=arm64 CGO_ENABLED=0 go build -ldflags "-s -w" -o build/cursor-vip_windows_arm64.exe
rm rsrc.syso

# Phân quyền thực thi
chmod +x build/cursor-vip_windows_amd64.exe
chmod +x build/cursor-vip_windows_arm64.exe
