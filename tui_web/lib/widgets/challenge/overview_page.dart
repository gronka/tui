//import 'dart:html';
import 'package:universal_html/html.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:tui_lib/tui_lib.dart';
import 'package:tui_web/widgets/console/console_wrapper.dart';

class ChallengeOverviewPage extends StatefulWidget {
  final String challengeId;
  const ChallengeOverviewPage({required this.challengeId});

  @override
  ChallengeOverviewPageState createState() => ChallengeOverviewPageState();
}

class ChallengeOverviewPageState extends State<ChallengeOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return ConsoleWrapper(
      body: Observer(builder: (context) {
        Challenge challenge =
            ChallengeProxy.of(context).getById(widget.challengeId);
        Comparable comparable =
            ComparableProxy.of(context).getById(challenge.targetPropertyId);

        Lip lip = King.of(context).lip;

        return Column(
          children: <Widget>[
            //
            const Text22('Challenge Overview'),
            const SizedBox(height: 12),
            Text20(comparable.fullAddress),
            const SizedBox(height: 30),

            const Text20(
                'Two documents are generated to help you challenge your property appraisal. Your challenge document must be printed, signed, and mailed by ??? to be accepted by the state of New York.'),
            const SizedBox(height: 12),

            const Text20(
                'The Comparables Document is the data we collected in order to generate you Challenge Document.'),
            const SizedBox(height: 12),

            const Text20(
                'We recommend reviewing all documents before submittal. FairlyTaxed cannot guarantee that your challenge will be accepted. We will monitor generated documents to improve our algorithm. For complex inquiries, we recommend consulting a tax attorney.'),
            const SizedBox(height: 30),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //
                  TextButton(
                    onPressed: () {
                      String path =
                          '${EndpointsV2.challengeDocDownload}/${comparable.challengeDocName}';
                      String url = (lip.makeApiUri(path) ?? Uri()).toString();
                      AnchorElement(href: url)
                        ..setAttribute('download', comparable.comparableDocName)
                        ..click();
                    },
                    child: Text20(
                      'Download Challenge Document',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 40),

                  TextButton(
                    onPressed: () {
                      String path =
                          '${EndpointsV2.comparableDocDownload}/${comparable.comparableDocName}';
                      String url = (lip.makeApiUri(path) ?? Uri()).toString();
                      AnchorElement(href: url)
                        ..setAttribute('download', comparable.comparableDocName)
                        ..click();
                    },
                    child: Text20(
                      'Download Comparables Document',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ]),

            const SizedBox(height: 12),
            Text('Challenge: ${challenge.challengeId}'),
            const SizedBox(height: 16),
          ],
        );
      }),
    );
  }
}
