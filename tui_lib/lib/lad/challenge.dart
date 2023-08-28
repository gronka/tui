import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'challenge.g.dart';

class ChallengeProxy {
  ChallengeProxy({
    required this.challengeCache,
    required this.king,
  });
  final Cache<Challenge> challengeCache;
  final King king;

  Challenge getById(
    String challengeId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      challengeCache.apiGetById(
          url: EndpointsV2.challengeGetById,
          idName: 'ChallengeId',
          id: challengeId,
          forceApi: forceApi);
    }

    return challengeCache.getItem(challengeId);
  }

  static ChallengeProxy of(BuildContext context) {
    return King.of(context).lad.challengeProxy;
  }
}

class Challenge = ChallengeBase with _$Challenge;

abstract class ChallengeBase with Store {
  @observable
  String challengeId = '';
  @observable
  String surferId = '';
  @observable
  String targetPropertyId = '';
  @observable
  int timeCreated = 0;

  bool isLoaded = false;

  void clear() {
    challengeId = '';
    surferId = '';
    targetPropertyId = '';
    timeCreated = 0;
  }

  static Challenge unpackById(Map<String, dynamic> body, Challenge tt) {
    tt.challengeId = readString(body, 'ChallengeId');
    tt.surferId = readString(body, 'SurferId');
    tt.targetPropertyId = readString(body, 'TargetPropertyId');
    tt.timeCreated = readInt(body, 'TimeCreated');

    tt.isLoaded = true;
    return tt;
  }

  static copier(Challenge dest, Challenge alt) {
    dest.loadFromAltChallenge(alt);
  }

  void loadFromAltChallenge(Challenge alt) {
    challengeId = alt.challengeId;
    surferId = alt.surferId;
    targetPropertyId = alt.targetPropertyId;
    timeCreated = alt.timeCreated;

    isLoaded = true;
  }

  String shortId() {
    return challengeId.split('-').first;
  }
}
