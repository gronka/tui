class Args {
  String amount;
  String billId;
  String challengeId;
  String paymentAttemptId;
  String paymentId;
  String planId;
  String probiusId;
  String projectId;
  String propertyId;
  String stripeUrl;
  String surferId;
  String token;
  Args({
    this.amount = '',
    this.billId = '',
    this.challengeId = '',
    this.paymentAttemptId = '',
    this.paymentId = '',
    this.planId = '',
    this.probiusId = '',
    this.projectId = '',
    this.propertyId = '',
    this.stripeUrl = '',
    this.surferId = '',
    this.token = '',
  });

  Map<String, String> asMap() {
    Map<String, String> map = {};

    amount.isNotEmpty ? map['amount'] = amount : null;
    billId.isNotEmpty ? map['billId'] = billId : null;
    challengeId.isNotEmpty ? map['challengeId'] = challengeId : null;
    paymentAttemptId.isNotEmpty
        ? map['paymentAttemptId'] = paymentAttemptId
        : null;
    paymentId.isNotEmpty ? map['paymentId'] = paymentId : null;
    planId.isNotEmpty ? map['planId'] = planId : null;
    probiusId.isNotEmpty ? map['probiusId'] = probiusId : null;
    projectId.isNotEmpty ? map['projectId'] = projectId : null;
    propertyId.isNotEmpty ? map['propertyId'] = propertyId : null;
    stripeUrl.isNotEmpty ? map['stripeUrl'] = stripeUrl : null;
    surferId.isNotEmpty ? map['surferId'] = surferId : null;
    token.isNotEmpty ? map['token'] = token : null;

    return map;
  }

  static Args fromMap(Map<String, String> map) {
    final args = Args();

    args.amount = map['amount'] ?? '';
    args.billId = map['billId'] ?? '';
    args.challengeId = map['challengeId'] ?? '';
    args.paymentAttemptId = map['paymentAttemptId'] ?? '';
    args.paymentId = map['paymentId'] ?? '';
    args.planId = map['planId'] ?? '';
    args.probiusId = map['probiusId'] ?? '';
    args.projectId = map['projectId'] ?? '';
    args.propertyId = map['propertyId'] ?? '';
    args.stripeUrl = map['stripeUrl'] ?? '';
    args.surferId = map['surferId'] ?? '';
    args.token = map['token'] ?? '';

    return args;
  }

  //String makePath(String pathRoot) {
  //String params = '';

  //for (var kv in this.asMap().entries) {
  //params += '${kv.key}=${kv.value}&';
  //}
  //if (params.endsWith('&')) {
  //params = params.substring(0, params.length - 1);
  //}

  //if (params.isEmpty) {
  //return pathRoot;
  //} else {
  //return '$pathRoot?$params';
  //}
  //}
}
