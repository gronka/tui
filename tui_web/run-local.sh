#!/bin/sh

STRIPE_PKEY=`cat /taxed/certs/stripe.test.public_key`

#flutter run -d chrome --web-port 4000 --web-renderer html
flutter run \
	-d chrome \
	--web-port 4000 \
	--dart-define=ENV=dev \
	--dart-define=STRIPE_PKEY=${STRIPE_PKEY} \
	--dart-define=SITE_URL=http://localhost:4000
