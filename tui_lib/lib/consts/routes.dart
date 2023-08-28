class Routes {
  static const String faq = '/faq';
  static const String privacy = '/privacy';
  static const String terms = '/terms';

  static const String empty = '';
  static const String home = '/';
  static const String homeWord = '/home';

  static const String account = '/account';
  static const String chat = '/chat';
  static const String console = '/console';
  static const String contact = '/contact-us';
  static const String signIn = '/signIn';
  static const String welcome = '/welcome';

  static const String enrollment = '/enrollment';
  static const String archive = '/archive';

  static const String challenges = '/challenges';
  static const String challengeCreate = '/challenge/create';
  static const String challengeOverview = '/challenge/overview';

  static const String planChange = '/plan/change';

  static const String properties = '/properties';
  static const String propertyCreate = '/property/create';
  static const String propertyDelete = '/property/delete';
  static const String propertyOverview = '/property/overview';

  static const String surfer = '/surfer';
  static const String surferBilling = '/surfer/billing';
  static const String surferAccountAdministration =
      '/surfer/account.administration';
  static const String surferAccountClose = '/surfer/account.close';
  static const String surferEmailConfirmLink = '/email.confirm.link';

  static const String surferChangeEmailRequest = '/surfer/change.email.request';
  static const String surferChangeEmailLink = '/change.email.link';
  static const String surferChangeEmailValidateNewLink =
      '/change.email.validate.new.link';
  static const String surferChangePasswordRequest =
      '/surfer/change.password.request';
  static const String surferChangePasswordLink = '/change.password.link';
  static const String surferChangePasswordValidateNewLink =
      '/change.password.validate.new.link';

  static const String surferPayment = '/surfer/payment';
  static const String surferPlan = '/surfer/plan';

  static const String surferSetEmail = '/surfer/set.email';
  static const String surferSetFirstName = '/surfer/set.firstName';
  static const String surferSetLastName = '/surfer/set.lastName';
  static const String surferSetPassword = '/surfer/set.password';
  static const String surferSetPhone = '/surfer/set.phone';

  static const String loggedOutChangePasswordRequest =
      '/loggedOutChangePasswordRequest';
  static const String confirmEmail = '/confirmEmail';

  // library routes
  static const String paymentAddCard = '/payment/add.card';
  static const String paymentAddCredit = '/payment/add.credit';
  static const String paymentAutopay = '/payment/autopay';
  static const String paymentChangeOverage = '/payment/change.overage';
  static const String paymentCheckoutConfirm = '/payment/checkout.confirm';
  static const String paymentCheckoutCrypto = '/payment/checkout.crypto';
  static const String paymentCheckoutStripe = '/payment/checkout.stripe';
  static const String paymentCryptoAddress = '/payment/cryptoAddress';
  static const String paymentHistory = '/payment/history';
  static const String paymentMethods = '/payment/methods';

  static const String billOverview = '/bill/overview';
  static const String billPayNow = '/bill/payNow';
  static const String billingActivity = '/billingActivity';
  static const String billsView = '/billsView';
  static const String paymentsView = '/paymentsView';

  static const String paymentFailed = '/payment/failed';
  static const String paymentThankYou = '/payment/thankYou';
  static const String paymentWaitForStripe = '/payment/waitForStripe';
}
