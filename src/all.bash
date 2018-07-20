#!/usr/bin/env bash
# Copyright 2009 The Go Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -e
if [ ! -f make.bash ]; then
	echo 'all.bash must be run from $GOROOT/src' 1>&2
	exit 1
fi
OLDPATH="$PATH"

# $* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，
# 都以"$1" "$2" … "$n" 的形式输出所有参数。
# 但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，
# 以"$1 $2 … $n"的形式输出所有参数；"$@" 会将各个参数分开，
#以"$1" "$2" … "$n" 的形式输出所有参数。
. ./make.bash "$@" --no-banner
bash run.bash --no-rebuild
PATH="$OLDPATH"
$GOTOOLDIR/dist banner  # print build info
