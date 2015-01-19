all: build

build:
	browserify -t coffeeify --extension=".coffee" jackpot.coffee > jackpot.js

watch:
	./node_modules/watchify/bin/cmd.js -t coffeeify --extension=".coffee" jackpot.coffee -o jackpot.js

serve:
	serve -p 4000

.PHONY: build watch serve
