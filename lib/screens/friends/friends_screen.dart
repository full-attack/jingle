import 'package:flutter/material.dart';

import 'package:jingle/constants.dart';
import 'components/friends_card.dart';

class FriendsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("People"),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: demoContactsImage.length,
        itemBuilder: (context, index) => FriendCard(
          name: "Фамилия Имя",
          //name: demoContactsName[index],
          number: "(927) 444-44-44",
          image: demoContactsImage[index],
          isActive: index.isEven, // for demo
          press: () {},
        ),
      ),
    );
  }
}