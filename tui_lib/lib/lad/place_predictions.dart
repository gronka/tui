import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

class PlacePredictionsProxy {
  Cache<ObservableList<PlacePrediction>> placePredictionsCache;
  PlacePredictionsProxy({required this.placePredictionsCache});

  // default lat/lng are new york state
  ObservableList<PlacePrediction> getPredictions({
    required String input,
    double lat = 43.2994,
    double long = 74.2179,
  }) {
    // Round lat and long. These values hardly affect results, so we
    // can round them to reduce noise
    int latInt = (lat / 3).round() * 3;
    int longInt = (long / 3).round() * 3;
    String uuid = '$input,$latInt,$longInt';

    Map<String, String>? payload;

    /// Skip autocomplete queries if the lookup string is too short.
    if (input.length < 3) {
      return ObservableList<PlacePrediction>();
    }

    payload = {
      'Input': input,
      'Lat': '$latInt',
      'Long': '$longInt',
    };

    placePredictionsCache.apiGetByPayload(
      url: EndpointsV2.placePredictionsGet,
      id: uuid,
      payload: payload,
      unpackByPayload: this.getUnpack,
    );

    return placePredictionsCache.getItem(uuid);
  }

  dynamic getUnpack(Map<String, dynamic> jin, dynamic tt) {
    tt.clear();
    for (final obj in jin['Collection']) {
      var prediction = PlacePrediction.unpackById(obj, PlacePrediction());
      tt.add(prediction);
    }
  }
}

class PlacePrediction {
  String address = '';
  String placeId = '';

  static PlacePrediction unpackById(
      Map<String, dynamic> body, PlacePrediction tt) {
    var temp = readString(body, 'Address');
    if (tt.address != temp) {
      tt.address = temp;
    }
    temp = readString(body, 'PlaceId');
    if (tt.placeId != temp) {
      tt.placeId = temp;
    }

    return tt;
  }

  @override
  String toString() {
    return 'address: $address, placeId: $placeId';
  }
}

class Place {
  String address = '';
  String city = '';
  String county = '';
  String country = '';
  String postal = '';
  String state = '';
  String streetNumber = '';
  String streetName = '';
  String street2 = '';
  String placeId = '';

  Place({
    required this.address,
    required this.city,
    required this.county,
    required this.country,
    required this.postal,
    required this.state,
    required this.streetNumber,
    required this.streetName,
    required this.street2,
    required this.placeId,
  });

  factory Place.fromJson(Map<String, dynamic> jin) => Place(
        address: readString(jin, 'Address'),
        city: readString(jin, 'City'),
        county: readString(jin, 'County'),
        country: readString(jin, 'Country'),
        postal: readString(jin, 'Postal'),
        state: readString(jin, 'State'),
        streetNumber: readString(jin, 'StreetNumber'),
        streetName: readString(jin, 'StreetName'),
        street2: readString(jin, 'Street2'),
        placeId: readString(jin, 'PlaceId'),
      );

  @override
  String toString() {
    return 'address: $address, placeId: $placeId';
  }

  String get street1 {
    return '$streetNumber $streetName';
  }
}
