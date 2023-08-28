import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:tui_lib/tui_lib.dart';

class PlasticSlab extends StatelessWidget {
  const PlasticSlab({
    this.index,
    required this.plastic,
  });
  final int? index;
  final Plastic plastic;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        width: 260,
        child: Observer(
          builder: (_) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 12),
              SizedBox(
                width: 72,
                height: 72,
                child: plastic.brandImage,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(plastic.brandDisplay),
                      const SizedBox(height: 6),
                      Text20('***-***-****-${plastic.last4}'),
                      const SizedBox(height: 6),
                      Text(plastic.expDate),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
