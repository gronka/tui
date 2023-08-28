import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage();

  @override
  ChallengesPageState createState() => ChallengesPageState();
}

class ChallengesPageState extends State<ChallengesPage> {
  bool _forceLoad = true;

  @override
  Widget build(BuildContext context) {
    return ConsoleWrapper(
      body: Column(
        children: <Widget>[
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text18('Challenges:'),
              ]),

          const SizedBox(height: 12),
          _buildChallengesList(context)

          //
        ],
      ),
    );
  }

  Widget _buildChallengesList(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      ObservableList challengeIdList =
          Lad.of(context).challengeIdListBySurferIdCache.apiGetById(
                id: King.of(context).todd.surferId,
                forceApi: _forceLoad,
                collectionCache: Lad.of(context).challengeCache,
              );
      _forceLoad = false;

      List<Challenge> challenges = Lad.of(context)
          .challengeCache
          .getItemsAsList(List.from(challengeIdList));

      challenges.sort((a, b) => a.timeCreated.compareTo(b.timeCreated));

      return challenges.isNotEmpty
          ? ListView.builder(
              itemCount: challenges.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var challenge = challenges[index];
                var property = Lad.of(context)
                    .propertyProxy
                    .getById(challenge.targetPropertyId);

                return Card(
                  child: InkWell(
                    key: Key('challengeId:${challenge.challengeId}'),
                    onTap: () {
                      context.goNamed(
                        Routes.challengeOverview,
                        params: {'challengeId': challenge.challengeId},
                      );
                    },
                    child: ListTile(
                      leading: const FlutterLogo(),
                      title: Text(
                        '#${index + 1} - ${property.address}',
                      ),
                      subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID: ${challenge.shortId()}',
                            ),
                            Text(
                              stampToDateShort(challenge.timeCreated),
                            ),
                          ]),
                    ),
                  ),
                );
              },
            )
          : const Text18('You have not added a challenge yet.');
    });
  }
}
