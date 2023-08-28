import 'package:intl/intl.dart';

import 'package:tui_lib/tui_lib.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({required this.probiusId});
  final String probiusId;

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final DateTime _now = DateTime.now();
  late DateTime _nextPaymentDate;
  final currentYear = DateTime.now().year;
  final currentMonth = DateTime.now().month;

  @override
  initState() {
    super.initState();
    if (_now.day > 14) {
      _nextPaymentDate = DateTime(currentYear, currentMonth + 1, 14);
    } else {
      _nextPaymentDate = DateTime(currentYear, currentMonth, 14);
    }
  }

  @override
  Widget build(BuildContext context) {
    //var date = '2022';
    var king = King.of(context);

    final probius = ProbiusProxy.of(context).getById(widget.probiusId);
    final project = ProjectProxy.of(context).getById(probius.projectId);
    final plan = PlanProxy.of(context).getById(project.planId);

    return WebScaffold(
      body: Center(
        child: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Text('Billing Summary', style: king.theme.styles.titleMedium),
              const Divider(color: Colors.black),
              SimpleRow(left: 'Project credit', right: probius.credit.toUsd),
              SimpleRow(left: 'Current plan:', right: plan.title),
              SimpleRow(
                  left: 'Next payment due on:',
                  right: DateFormat.yMMMd().format(_nextPaymentDate)),
              SimpleRow(
                  left: 'Autopay is:', right: probius.isAutopayEnabledString),
              //SimpleRow(left: 'Autopayment method:', right: date),
              //

              const SizedBox(height: 20),
              Text('Purchase Summary', style: king.theme.styles.titleMedium),
              const Divider(color: Colors.black),
              SimpleRow(
                  left: 'Challenge tokens bought:',
                  right: probius.tokensBought.display),
              SimpleRow(
                  left: 'Challenge tokens used:',
                  right: probius.tokensUsed.display),
              SimpleRow(
                  left: 'Challenge Tokens remaining:',
                  right: probius.tokensRemaining.display),
              const SizedBox(height: 16),
              //

              const SizedBox(height: 24),
              const Text18(
                  'Credit is automatically applied to your balance and future payments.'),
              const SizedBox(height: 12),

              FunctionCard(
                text: 'Manage autopay',
                onTap: () {
                  context.goNamed(
                    Routes.paymentAutopay,
                    params: Args(probiusId: widget.probiusId).asMap(),
                  );
                },
              ),
              const SizedBox(height: 12),

              const SizedBox(height: 8),
              FunctionCard(
                  text: 'Add credit with card',
                  onTap: () {
                    context.goNamed(
                      Routes.paymentAddCredit,
                      params: Args(probiusId: widget.probiusId).asMap(),
                    );
                  }),
              const SizedBox(height: 12),

              FunctionCard(
                text: 'Payment History',
                onTap: () {
                  context.goNamed(
                    Routes.paymentsView,
                    params: Args(probiusId: widget.probiusId).asMap(),
                  );
                },
              ),
              const SizedBox(height: 12),
              //

              FunctionCard(
                text: 'View Bills',
                onTap: () {
                  context.goNamed(
                    Routes.billsView,
                    params: Args(probiusId: widget.probiusId).asMap(),
                  );
                },
              ),
              const SizedBox(height: 12),

              FunctionCard(
                text: 'Show Billing Activity',
                onTap: () {
                  context.goNamed(
                    Routes.billsView,
                    params: Args(probiusId: widget.probiusId).asMap(),
                  );
                },
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
