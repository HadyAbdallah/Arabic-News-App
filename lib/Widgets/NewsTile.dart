import 'package:flutter/material.dart';
import 'package:news/Models/ArticleModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.artical});

  final ArticleModel artical;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WebViewController controller;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(artical.url));
          return WebViewWidget(controller: controller);
        }));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                artical.image ??
                    "https://www.cairo24.com/UploadCache/libfiles/79/6/600x338o/111.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 12,
          ),
          Text(
            artical.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            artical.subTitle ?? '',
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}
