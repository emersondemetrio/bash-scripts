#!/bin/bash

JAR_PATH="/Users/<your-path>/scripts/android-release-suite/bundletool-all-1.10.0.jar"
KEY_PATH="/Users/<your-path>/scripts/android-release-suite/my-upload-key.keystore"
AAB_PATH=$1

java -jar $JAR_PATH build-apks \
    --bundle=$AAB_PATH \
    --output=./app.apks \
    --mode=universal \
    --ks=$KEY_PATH \
    --key-pass='pass:123456' \
    --ks-pass='pass:123456' \
    --ks-key-alias=my-key-alias && mv ./app.apks ./app.zip

unzip ./app.zip

open .
