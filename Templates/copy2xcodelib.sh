#!/bin/sh
XCODE_PATH="/Developer"
XCODE_APP="${XCODE_PATH}/Applications/Xcode.app"
FILE_TEMPLATES_PATH="${XCODE_PATH}/Library/Xcode/File Templates"
SOURCE_PATH="User Templates"

if [ ! -d "${SOURCE_PATH}" ]; then
	echo "Source templates not found."
	exit 1
fi

if [ ! -d "${XCODE_APP}" ]; then
	echo "Xcode not installed at ${XCODE_APP}?"
	exit 1
fi

mkdir -p "${FILE_TEMPLATES_PATH}"
cp -r "${SOURCE_PATH}" "${FILE_TEMPLATES_PATH}"
