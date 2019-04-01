#!/bin/bash

main() {
	seaslog_ver="2.0.2"
	stage=$(mktemp -d)

	# Install SeasLog
	cd $stage
	wget -O seaslog.tar.gz https://github.com/SeasX/SeasLog/archive/SeasLog-${seaslog_ver}.tar.gz
	tar -zxf seaslog.tar.gz
	cd SeasLog-SeasLog-${seaslog_ver}
	phpize
	./configure
	make -j4
	sudo make install
	phpenv config-add ci/seaslog.ini
	# echo "extension = swoole.so" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini
	echo $(php -r "var_dump(extension_loaded('seaslog'));")
	echo $(php -r "var_dump(SEASLOG_DEBUG);")

	cd $TRAVIS_BUILD_DIR
	sudo rm -rf $stage
}

main