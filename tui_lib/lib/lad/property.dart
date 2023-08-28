import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'property.g.dart';

class PropertyProxy {
  PropertyProxy({
    required this.propertyCache,
    required this.king,
  });
  final Cache<Property> propertyCache;
  final King king;

  Property getById(
    String propertyId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      propertyCache.apiGetById(
          url: EndpointsV2.propertyGetById,
          idName: 'PropertyId',
          id: propertyId,
          forceApi: forceApi);
    }

    return propertyCache.getItem(propertyId);
  }
}

class Property = PropertyBase with _$Property;

abstract class PropertyBase with Store {
  @observable
  String propertyId = '';
  @observable
  String surferId = '';

  @observable
  String address = '';
  @observable
  String street1 = '';
  @observable
  String street2 = '';
  @observable
  String state = '';
  @observable
  String city = '';
  @observable
  String county = '';
  @observable
  String country = '';
  @observable
  String postal = '';
  @observable
  int timeUpdated = 0;

  @observable
  String notes = '';
  @observable
  String thumbUrl = '';

  bool isLoaded = false;

  void clear() {
    propertyId = '';
    surferId = '';
    address = '';
    street1 = '';
    street2 = '';
    state = '';
    city = '';
    county = '';
    country = '';
    postal = '';
    timeUpdated = 0;

    notes = '';
    thumbUrl = '';
  }

  void loadFromAltProperty(Property alt) {
    propertyId = alt.propertyId;
    surferId = alt.surferId;
    address = alt.address;
    street1 = alt.street1;
    street2 = alt.street2;
    state = alt.state;
    city = alt.city;
    county = alt.county;
    country = alt.country;
    postal = alt.postal;
    timeUpdated = alt.timeUpdated;

    notes = alt.notes;
    thumbUrl = alt.thumbUrl;
    isLoaded = true;
  }

  static copier(Property dest, Property alt) {
    dest.loadFromAltProperty(alt);
  }

  static Property unpackById(Map<String, dynamic> body, Property tt) {
    tt.propertyId = readString(body, 'PropertyId');
    tt.surferId = readString(body, 'SurferId');
    tt.address = readString(body, 'Address');
    tt.street1 = readString(body, 'Street1');
    tt.street2 = readString(body, 'Street2');
    tt.state = readString(body, 'State');
    tt.city = readString(body, 'City');
    tt.county = readString(body, 'County');
    tt.country = readString(body, 'Country');
    tt.postal = readString(body, 'Postal');
    tt.timeUpdated = readInt(body, 'TimeUpdated');

    tt.notes = readString(body, 'Notes');
    //thumbUrl = readString(body, 'ThumbUrl');

    tt.isLoaded = true;
    return tt;
  }
}
