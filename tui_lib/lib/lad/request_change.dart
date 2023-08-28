import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'request_change.g.dart';

class RequestChange = RequestChangeBase with _$RequestChange;

abstract class RequestChangeBase with Store {
  @observable
  String surferId = '';
  @observable
  bool isConsumed = false;
  @observable
  int timeExpires = 0;

  @observable
  String token = '';

  loadFromApi({
    required BuildContext context,
    required String endpoint,
    required String token,
  }) async {
    if (token.isEmpty) {
      return;
    }
    ApiResponse ares = await King.of(context).lip.api(
      endpoint,
      payload: {'Token': token},
    );

    if (ares.isOk) {
      unpackFromApi(ares.body);
    }
  }

  void unpackFromApi(Map<String, dynamic> body) {
    isConsumed = readBool(body, 'IsConsumed');
    surferId = readString(body, 'SurferId');
    timeExpires = readInt(body, 'TimeExpires');
  }

  @computed
  bool get isExpiredOrConsumed {
    return ((DateTime.now().millisecondsSinceEpoch / 1000) > timeExpires) ||
        isConsumed;
  }
}
