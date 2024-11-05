import 'package:flutter/material.dart';

import 'app-theme.dart';

class MessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Image.network(
                  "https://avatar.iran.liara.run/public",
                  width: 96,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("iodqfojqsioid@gmail"), Text("56s", style: TextStyle(fontWeight: FontWeight.bold),)],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: Image.asset("reply.png", width: 26,)),
                IconButton(onPressed: () {}, icon: Image.asset("retweet.png", width: 26,)),
                IconButton(onPressed: () {}, icon: Image.asset("favorite.png", width: 26,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
