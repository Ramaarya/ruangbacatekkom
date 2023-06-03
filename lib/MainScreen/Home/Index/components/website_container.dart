import 'package:flutter/material.dart';
import 'package:rbc_kp/MainScreen/screens/webview.dart';

class WebsiteContainer extends StatelessWidget {
  const WebsiteContainer({
    super.key,
    required this.webIcon,
    required this.webTitle,
    required this.link,
  });

  final String webIcon;
  final String webTitle;
  final String link;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widthScreen,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(60, 21, 81, 242),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/website/$webIcon.png',
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    webTitle,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return WebviewPage(title: webTitle, url: link);
                      }));
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(color: Color(0xff4EA8DE)),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xff4EA8DE),
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Menuju Website'),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
