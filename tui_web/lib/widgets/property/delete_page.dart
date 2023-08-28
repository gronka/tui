import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class PropertyDeletePage extends StatefulWidget {
  final String propertyId;
  const PropertyDeletePage({required this.propertyId});

  @override
  PropertyDeletePageState createState() => PropertyDeletePageState();
}

class PropertyDeletePageState extends State<PropertyDeletePage> {
  String _failureMsg = '';
  bool _requestInProgress = false;

  @override
  Widget build(BuildContext context) {
    return ConsoleWrapper(
      body: Observer(builder: (context) {
        Property property =
            King.of(context).lad.propertyProxy.getById(widget.propertyId);

        return Column(
          children: <Widget>[
            const Text('Are you sure you want to delete this proeprty?'),
            const SizedBox(height: 12),
            Text('Address: ${property.address}'),
            const SizedBox(height: 12),
            //

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go(Routes.properties);
                      }
                    },
                    child: Text(
                      'No - go back',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _onYes(context, property);
                    },
                    child: Text(
                      'Yes - delete property',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ]),
            FailureMsg(_failureMsg),
          ],
        );
      }),
    );
  }

  _onYes(BuildContext context, Property property) async {
    var king = King.of(context);
    if (!_requestInProgress) {
      setState(() {
        _failureMsg = '';
        _requestInProgress = true;
      });

      ApiResponse ares = await king.lip.api(
        EndpointsV2.propertyDelete,
        payload: {
          'PropertyId': property.propertyId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });

      if (ares.isOk) {
        if (!mounted) return;
        context.go(Routes.properties);
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: 'Error deleting property.');
        });
      }
    }
  }
}
