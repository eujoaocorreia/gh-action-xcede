LATEST_XCODE=$(ls -d /Applications/Xcode_*.app 2>/dev/null | sort -V | tail -n 1)
echo "$LATEST_XCODE"
