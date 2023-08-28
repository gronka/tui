import 'dart:ui' as ui;
import 'package:tui_lib/tui_lib.dart';
import 'package:universal_html/html.dart';

class IFramePage extends StatelessWidget {
  final String elId;
  final String url;
  const IFramePage({required this.elId, required this.url});

  @override
  Widget build(BuildContext context) {
    IFrameElement iframeElement = IFrameElement()
      ..src = url
      ..id = elId
      ..style.border = 'none';

    ui.platformViewRegistry.registerViewFactory(
      elId,
      (int viewId) => iframeElement,
    );

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: HtmlElementView(
            viewType: elId,
          ),
        ),
      ),
    );
  }
}
