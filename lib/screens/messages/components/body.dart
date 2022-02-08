import 'package:jingle/constants.dart';
import 'package:jingle/models/chat_messange.dart';
import 'package:flutter/material.dart';

import 'package:jingle/screens/messages/components/chat_input_field.dart';
import 'package:jingle/screens/messages/components/message.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
