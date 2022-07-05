import 'package:flutter/material.dart';

Future<String?> userInfo(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => const AlertDialog(
      title: Text('User information'),
    ),
  );
}

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent,
          ),
          width: mediaQuery.width * .95,
          height: mediaQuery.height * .3,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          width: double.infinity,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const FlutterLogo(
                  size: 18,
                ),
                const SizedBox(width: 10),
                Text(
                  'Flutter News | 4d',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  IconButton(
                    icon: isLiked
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          )
                        : const Icon(Icons.favorite_border_rounded),
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    splashRadius: 20,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert_rounded),
                    splashRadius: 20,
                    onPressed: () {
                      feedbackSheet(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

Future<void> feedbackSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    builder: (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text('Preferences & feedback'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.flag_outlined),
            title: const Text('Report'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text('Send feedback'),
            onTap: () {},
          )
        ],
      );
    },
  );
}
