import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'surfer.g.dart';

class SurferProxy {
  SurferProxy({required this.surferCache, required this.king});
  final Cache<Surfer> surferCache;
  final King king;

  Surfer getById(
    String surferId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      surferCache.apiGetById(
          url: EndpointsV2.surferGetById,
          idName: 'SurferId',
          id: surferId,
          forceApi: forceApi);
    }

    return surferCache.getItem(surferId);
  }

  static SurferProxy of(BuildContext context) {
    return King.of(context).lad.surferProxy;
  }
}

class Surfer = SurferBase with _$Surfer;

abstract class SurferBase with Store {
  @observable
  String surferId = '';
  @observable
  String projectId = '';
  @observable
  String email = '';
  @observable
  String phone = '';

  @observable
  bool isEmailVerified = false;
  @observable
  bool isPhoneVerified = false;

  @observable
  String firstName = '';
  @observable
  String lastName = '';

  bool isLoaded = false;

  void loadFromAltSurfer(Surfer alt) {
    surferId = alt.surferId;
    projectId = alt.projectId;
    email = alt.email;
    phone = alt.phone;

    firstName = alt.firstName;
    lastName = alt.lastName;
  }

  static copier(Surfer dest, Surfer alt) {
    dest.loadFromAltSurfer(alt);
  }

  static Surfer unpackById(Map<String, dynamic> body, Surfer tt) {
    String temp = readString(body, 'SurferId');
    if (tt.surferId != temp) {
      tt.surferId = temp;
    }
    temp = readString(body, 'ProjectId');
    if (tt.projectId != temp) {
      tt.projectId = temp;
    }

    temp = readString(body, 'Email');
    if (tt.email != temp) {
      tt.email = temp;
    }
    temp = readString(body, 'Phone');
    if (tt.phone != temp) {
      tt.phone = temp;
    }

    temp = readString(body, 'FirstName');
    if (tt.firstName != temp) {
      tt.firstName = temp;
    }
    temp = readString(body, 'LastName');
    if (tt.lastName != temp) {
      tt.lastName = temp;
    }

    tt.isLoaded = true;
    return tt;
  }

  @computed
  String get firstNameIs {
    if (firstName.isEmpty) {
      return 'not set';
    }
    return firstName;
  }

  @computed
  String get lastNameIs {
    if (lastName.isEmpty) {
      return 'not set';
    }
    return lastName;
  }
}
