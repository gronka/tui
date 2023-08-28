import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tui_lib/tui_lib.dart';

class AcceptTermsButton extends StatelessWidget {
  const AcceptTermsButton();

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Text('I agree to the '),
      TextButton(
        child: const Text('Terms & Conditions.'),
        onPressed: () => context.go(Routes.terms),
      ),
    ]);
  }
}
