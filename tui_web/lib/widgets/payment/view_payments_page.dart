import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

class ViewPaymentsPage extends StatefulWidget {
  final String probiusId;
  const ViewPaymentsPage({required this.probiusId});

  @override
  ViewPaymentsPageState createState() => ViewPaymentsPageState();
}

class ViewPaymentsPageState extends State<ViewPaymentsPage> {
  bool _forceLoad = true;
  PaymentAttemptType _selected = PaymentAttemptType.successful;

  bool get _isShowCcAttempts {
    return _selected == PaymentAttemptType.ccAttempt ? true : false;
  }

  bool get _isShowSuccessful {
    return _selected == PaymentAttemptType.successful ? true : false;
  }

  _setShowSuccessful() {
    setState(() {
      _selected = PaymentAttemptType.successful;
      _forceLoad = true;
    });
  }

  _setShowCcAttempts() {
    setState(() {
      _selected = PaymentAttemptType.ccAttempt;
      _forceLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final probius = ProbiusProxy.of(context).getById(widget.probiusId);
    final project = ProjectProxy.of(context).getById(probius.projectId);

    return WebScaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 24),
            Observer(
              builder: (_) => Text18('Payments for Project: ${project.name}'),
            ),
            const SizedBox(height: 24),
            //

            const Text18('Filter:'),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _isShowSuccessful,
                    onChanged: (bool? newValue) => _setShowSuccessful(),
                  ),
                  const Expanded(child: Text('Successful Payments')),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _isShowCcAttempts,
                    onChanged: (bool? newValue) => _setShowCcAttempts(),
                  ),
                  const Expanded(child: Text('All Payment Attempts')),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Observer(builder: (_) {
              ObservableList paymentIdList =
                  Lad.of(context).paymentIdListByProbiusIdCache.apiGetById(
                        id: widget.probiusId,
                        forceApi: _forceLoad,
                        collectionCache: Lad.of(context).challengeCache,
                      );
              _forceLoad = false;

              List<Payment> payments = Lad.of(context)
                  .paymentCache
                  .getItemsAsList(List.from(paymentIdList));

              if (_selected == PaymentStatus.processed) {
                payments.removeWhere(
                    (payment) => payment.status != PaymentStatus.processed);
              }

              return ListView.separated(
                shrinkWrap: true,
                itemCount: payments.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  var payment = payments[index];
                  return PaymentCard(
                    index: index,
                    payment: payment,
                  );
                },
              );
              //
            }),
            const SizedBox(height: 24),
          ]),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    required this.index,
    required this.payment,
  });
  final int index;
  final Payment payment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text18('${index + 1}. Payment for ${payment.silo.human}'),
              const SizedBox(height: 4),
              Text18('Price: ${payment.totalPrice.toUsd}'),
              const SizedBox(height: 4),

              Text18('Credit Applied: ${payment.creditApplied.toUsd}'),
              const SizedBox(height: 4),
              //

              payment.silo == PaymentSilo.billPay
                  ? FunctionCard(
                      text: 'View Bill',
                      onTap: () {
                        context.goNamed(
                          Routes.billOverview,
                          params: {'billId': payment.billId},
                        );
                      },
                    )
                  : const SizedBox.shrink(),

              SelectableText('Payment ID: ${payment.paymentId}'),
              const SizedBox(height: 4),

              //SelectableText('Attempt ID: ${payment.attemptId}'),
              //const SizedBox(height: 4),

              SelectableText('Bill ID: ${payment.billId}'),
              const SizedBox(height: 4),

              SelectableText('Status: ${payment.status.human}'),
              const SizedBox(height: 4),
            ]),
      ),
    );
  }
}
