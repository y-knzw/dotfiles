#!/bin/bash

curl -fL https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip -o /tmp/zenhan.zip
unzip /tmp/zenhan.zip -d /tmp
chmod u+x /tmp/zenhan/bin64/zenhan.exe
sudo mv /tmp/zenhan/bin64/zenhan.exe /usr/local/bin/zenhan
rm -rf /tmp/zenhan.zip /tmp/zenhan
