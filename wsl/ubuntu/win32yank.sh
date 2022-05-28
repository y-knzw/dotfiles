#!/bin/bash

curl -fL https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip -o /tmp/win32yank.zip
unzip /tmp/win32yank.zip -d /tmp/win32yank
chmod u+x /tmp/win32yank/win32yank.exe
sudo mv /tmp/win32yank/win32yank.exe /usr/local/bin/win32yank
rm -rf /tmp/win32yank.zip /tmp/win32yank
