FILE="$HOME/.config/chromium-flags.conf"
if [ -f "$FILE" ]; then
  export CHROMIUM_FLAGS="$CHROMIUM_FLAGS $(grep '^\(#.*\)\?$' -v $FILE | xargs)"
fi
