import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class PropertyOverviewPage extends StatefulWidget {
  final String propertyId;
  const PropertyOverviewPage({required this.propertyId});

  @override
  PropertyOverviewPageState createState() => PropertyOverviewPageState();
}

class PropertyOverviewPageState extends State<PropertyOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return ConsoleWrapper(
      body: Observer(builder: (context) {
        Property property =
            Lad.of(context).propertyProxy.getById(widget.propertyId);
        return Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Property Overview'),
                  //

                  TextButton(
                    onPressed: () {
                      context.goNamed(
                        Routes.propertyDelete,
                        params: Args(propertyId: widget.propertyId).asMap(),
                      );
                    },
                    child: Text(
                      'Delete property',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      context.goNamed(
                        Routes.challengeCreate,
                        params: Args(propertyId: widget.propertyId).asMap(),
                      );
                    },
                    child: Text(
                      'Create a challenge for this property',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ]),

            const SizedBox(height: 12),
            Text('Address: ${property.address}'),
            const SizedBox(height: 16),
            const Text('Previous Challenges:'),

            //
          ],
        );
      }),
    );
  }
}
