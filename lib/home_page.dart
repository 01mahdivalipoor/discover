import 'package:discover/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              mediaQuery.width * 0.02,
              mediaQuery.width * 0.05,
              mediaQuery.width * 0.02,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover',
                  style: Theme.of(context).textTheme.headline5,
                ),
                InkWell(
                  onTap: () => userInfo(context),
                  child: const CircleAvatar(
                    child: Center(
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mediaQuery.width * .03),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.fromLTRB(
              mediaQuery.width * 0.02,
              mediaQuery.width * 0.04,
              mediaQuery.width * 0.02,
              mediaQuery.width * 0.02,
            ),
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    8,
                    (index) => NewsWidget(context: context),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_outlined),
                  label: const Text('Discover more'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
