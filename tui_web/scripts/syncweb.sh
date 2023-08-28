#!/bin/sh
#flutter clean
cd ..
flutter build web \
	--dart-define="ENV=prod" \
	--dart-define="SITE_URL=https://fairlytaxed.com"

cd build/web
rsync -avcPz \
	--delete \
	* taxed:/taxed/web
