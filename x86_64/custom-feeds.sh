#!/bin/bash

# Add thrid party feed source
# echo 'src-git kiddin9 https://github.com/kiddin9/kwrt-packages;main' >> $BUILD_ROOT/feeds.conf.default
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon.git;master' >> $BUILD_ROOT/feeds.conf.default
echo 'src-git argonconfig https://github.com/jerrykuku/luci-app-argon-config.git;master' >> $BUILD_ROOT/feeds.conf.default