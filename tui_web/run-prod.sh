#!/bin/sh
#
STRIPE_PKEY=`cat /taxed/certs/stripe.prod.public_key`

#flutter run -d chrome --web-port 4000 --web-renderer html
flutter run \
	-d web-server \
	--web-port 4000 \
	--dart-define="ENV=prod" \
	--dart-define=STRIPE_PKEY=${STRIPE_PKEY} \
	--dart-define="SITE_URL=https://fairlytaxed.com"
