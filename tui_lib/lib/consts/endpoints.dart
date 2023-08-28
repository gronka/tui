class EndpointsV2 {
  static const String developerPrivacy = 'developer/privacy.latest';
  static const String developerTerms = 'developer/terms.latest';
  static const String surferPrivacy = 'surfer/privacy.latest';

  static String placeGetByPlaceId = 'place/get.byPlaceId';
  static String placePredictionsGet = 'place/predictions.get';

  static const String plog = 'plog';

  static const String surferGetById = 'surfer/get.byId';
  static const String surferEmailVerify = 'surfer/email.verify';

  static const String surferChangeEmail = 'surfer/change.email';
  static const String surferChangeEmailRequest = 'surfer/change.email.request';
  static const String surferChangeEmailRequestValidate =
      'surfer/change.email.request.validate';
  static const String surferChangeEmailValidateNewLink =
      'surfer/change.email.validate.new.link';
  static const String surferChangePassword = 'surfer/change.password';
  static const String surferChangePasswordRequest =
      'surfer/change.password.request';
  static const String surferChangePasswordRequestValidate =
      'surfer/change.password.request.validate';
  static const String surferChangePhone = 'surfer/change.phone';

  static const String surferRegisterWithEmail = 'surfer/register.withEmail';
  static const String surferSignInWithApple = 'surfer/signIn.withApple';
  static const String surferSignInWithEmail = 'surfer/signIn.withEmail';
  static const String surferSignInWithGoogle = 'surfer/signIn.withGoogle';
  static const String surferSignOut = 'surfer/signOut';
  static const String surferJwtRefresh = 'surfer/jwt.refresh';

  static const String surferSetFirstName = 'surfer/set.firstName';
  static const String surferSetLastName = 'surfer/set.lastName';
  static const String surferSetPhone = 'surfer/set.phone';

  static const String challengeCreate = 'challenge/create';
  static const String challengeGetById = 'challenge/get.byId';
  static const String challengesGetBySurferId = 'challenges/get.bySurferId';
  static const String comparableGetById = 'comparable/get.byId';

  static const String projectGetById = 'project/get.byId';
  static const String projectPlanIdNextChange = 'project/planIdNext.change';
  static const String projectPlanIdNextCancel = 'project/planIdNext.cancel';
  static const String probiusToggleAutopay = 'probius/toggle.autopay';

  static const String propertyCreate = 'property/create';
  static const String propertyDelete = 'property/delete';
  static const String propertyGetById = 'property/get.byId';
  static const String propertiesGetBySurferId = 'properties/get.bySurferId';

  static const String planGetById = 'plan/get.byId';
  static const String planChange = 'plan/change';
  //static const String plansGetByIdList = 'plans/get.byIdList';
  static const String plansGetAll = 'plans/get.all';

  static const String probiusGetById = 'probius/get.byId';

  static const String billGetById = 'bill/get.byId';
  static const String billsGetByProbiusId = 'bills/get.byProbiusId';
  static const String paymentsGetByProbiusId = 'payments/get.byProbiusId';

  static const String chargeGetById = 'charge/get.byId';
  static const String chargesGetByBillId = 'charges/get.byBillId';

  static const String probiusChangeDefaultPlasticId =
      'probius/change.defaultPlasticId';
  static const String probiusGetByProjectId = 'probius/get.byProjectId';
  static const String probiusPlasticAdd = 'probius/plastic.add';
  static const String probiusPlasticDelete = 'probius/plastic.delete';

  static const String probiusPlasticsGetAllByProbiusId =
      'probius/plastics/get.all.byProbiusId';

  static const String paymentGetById = 'payment/get.byId';
  static const String paymentsGetSuccessfulByProbiusId =
      'payments/get.successful.byProbiusId';
  static const String paymentsGetCcAttemptsByProbiusId =
      'payments/get.ccAttempts.byProbiusId';

  static const String paymentCheckoutCrypto = 'payment/checkout.crypto';
  static const String paymentCheckoutStripe = 'payment/checkout.stripe';

  static const String paymentAttemptStatusGetAndHandle =
      'paymentAttempt/status.getAndHandle';

  static const String stripePay = 'stripe/pay';

  static const String challengeDocDownload = 'challenge_doc/download';
  static const String comparableDocDownload = 'comparable_doc/download';
}
