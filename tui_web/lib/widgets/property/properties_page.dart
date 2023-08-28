import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class PropertiesPage extends StatefulWidget {
  @override
  PropertiesPageState createState() => PropertiesPageState();
}

class PropertiesPageState extends State<PropertiesPage> {
  bool _shouldLoad = true;

  @override
  Widget build(BuildContext context) {
    return ConsoleWrapper(
      body: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text18('Your Properties'),
                TextButton(
                  onPressed: () {
                    context.go(Routes.propertyCreate);
                  },
                  child: const Text18('Add a Property'),
                ),
              ]),

          const SizedBox(height: 12),
          _buildPropertiesList(context)

          //
        ],
      ),
    );
  }

  Widget _buildPropertiesList(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      ObservableList propertyIdList =
          Lad.of(context).propertyIdListBySurferIdCache.apiGetById(
                id: King.of(context).todd.surferId,
                forceApi: _shouldLoad,
                collectionCache: Lad.of(context).propertyCache,
              );
      _shouldLoad = false;

      List<Property> properties = Lad.of(context)
          .propertyCache
          .getItemsAsList(List.from(propertyIdList));

      return properties.isNotEmpty
          ? ListView.builder(
              itemCount: properties.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var prop = properties[index];

                return Card(
                  child: InkWell(
                    key: Key('propCardAddress:${prop.address}'),
                    onTap: () {
                      context.goNamed(
                        Routes.propertyOverview,
                        params: Args(propertyId: prop.propertyId).asMap(),
                      );
                    },
                    child: ListTile(
                      leading: const FlutterLogo(),
                      title: Text(
                        prop.address,
                      ),
                    ),
                  ),
                );
              },
            )
          : const Text18('You have not added a property yet.');
    });
  }
}
