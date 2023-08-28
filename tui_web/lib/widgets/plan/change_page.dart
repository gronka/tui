import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/payment/pay_form/pay_form.dart';

class PlanChangePage extends StatefulWidget {
  const PlanChangePage({required this.planId, required this.projectId});
  final String planId;
  final String projectId;

  @override
  PlanChangePageState createState() => PlanChangePageState();
}

class PlanChangePageState extends State<PlanChangePage> {
  PaymentDetails paymentDetails = PaymentDetails();
  final BasketItem planBasketItem = BasketItem();

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Center(
        //child: Text('hi'),
        child: Observer(builder: (_) {
          var project = ProjectProxy.of(context).getById(widget.projectId);
          var probius = ProbiusProxy.of(context).getById(project.probiusId);
          var plan = PlanProxy.of(context).getById(widget.planId);
          var currentPlan = PlanProxy.of(context).getById(project.planId);

          planBasketItem.itemType = BasketItemType.plan;
          planBasketItem.name = '${plan.title} plan subscription';
          planBasketItem.price = plan.price;

          paymentDetails.silo = PaymentSilo.plan;
          paymentDetails.addToBasket(planBasketItem);
          paymentDetails.applyCredit = probius.credit;
          paymentDetails.planId = widget.planId;
          paymentDetails.probiusId = probius.probiusId;
          paymentDetails.projectId = widget.projectId;
          paymentDetails.overrideTotal = plan.price;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextCard(
                  'You current plan is "${currentPlan.title}". You are attempting to change your plan to "${plan.title}".'),
              //
              TextCard(plan.priceForDisplaySentence),
              const TextCard(
                  'If you consume additional challenge tokens, you will be charged for them on the 1st of each month. If you miss a payment, your plan will continue to operate for 14 days before your service will be disabled.'),

              TextCard(
                  'Any credit on your project will be applied now. After this transaction, your project will have \$${paymentDetails.creditAfterTransaction.uncents} in credit.'),
              const SizedBox(height: 20),
              const BaText('Cost Summary'),
              const SizedBox(height: 20),

              SimpleRow(
                  left: 'Price:',
                  right: '\$${paymentDetails.totalPrice.uncents}'),
              SimpleRow(
                  left: 'Applied credit:',
                  right: '\$${paymentDetails.creditMax.uncents}'),
              const SizedBox(
                width: 340,
                child: Divider(color: Colors.black),
              ),
              SimpleRow(
                  left: 'Amount due now:',
                  right: '\$${paymentDetails.totalPriceAfterCredit.uncents}'),
              //

              const SizedBox(height: 20),

              PayForm(
                paymentDetails: paymentDetails,
                //probiusId: probius.probiusId,
                probiusId: 'b137e642-097f-45c3-8c46-e929e86f9114',
              ),
            ],
          );
        }),
        //
      ),
    );
  }
}
