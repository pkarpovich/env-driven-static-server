#!/bin/sh

set -e

INDEX_HTML_PATH="/public/index.html"
ENV_JS_FILE_PATH="/public/env-config.js"

echo "window._env_ = {" >> $ENV_JS_FILE_PATH

for var in $(env | grep ^VITE_ | cut -d= -f1)
do
    echo "    $var: \"$(printenv $var)\"," >> $ENV_JS_FILE_PATH
done

echo "}" >> $ENV_JS_FILE_PATH

sed -i "s|</head>|<script src=\"/env-config.js?$(date +%s)\"></script></head>|" $INDEX_HTML_PATH

echo "Injected the following environment variables into $INDEX_HTML_PATH:"

if [ "${1#-}" != "$1" ]; then
    set -- static-web-server "$@"
fi

exec "$@"
