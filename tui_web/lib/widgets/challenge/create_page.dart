import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class ChallengeCreatePage extends StatefulWidget {
  final String propertyId;
  const ChallengeCreatePage({required this.propertyId});

  @override
  ChallengeCreatePageState createState() => ChallengeCreatePageState();
}

class ChallengeCreatePageState extends State<ChallengeCreatePage> {
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
            const Text('You currently have X tokens. Are you sure you want '
                'to spend a token to create this challenge?'),
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
                      'Yes - create challenge',
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
        EndpointsV2.challengeCreate,
        payload: {
          'PropertyId': property.propertyId,
        },
      );

      setState(() {
        _requestInProgress = false;
      });

      if (ares.isOk) {
        if (!mounted) return;
        Lad.of(context).challengeIdListBySurferIdCache.apiGetById(
              id: King.of(context).todd.surferId,
              forceApi: true,
              collectionCache: Lad.of(context).challengeCache,
            );
        context.go(Routes.challenges);
      } else {
        setState(() {
          _failureMsg =
              ares.peekErrorMsg(defaultText: 'Error creating challenge.');
        });
      }
    }
  }
}
