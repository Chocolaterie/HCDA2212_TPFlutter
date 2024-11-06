import 'package:flutter/material.dart';
import 'message.dart';

class MessageCard extends StatelessWidget {

  Message message;

  MessageCard(this.message);

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
                  message.profile,
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
                        children: [Text(message.author), Text(message.formatDuration(), style: TextStyle(fontWeight: FontWeight.bold),)],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          message.message,
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
