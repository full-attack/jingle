class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Гамидов Шамсудин",
    lastMessage: "Завтра в 10 на покру",
    image: "assets/images/icon_1.jpg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Ворожцов Михаил",
    lastMessage: "Я на работе, что звонил?",
    image: "assets/images/icon_2.jpg",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Пашута Павел",
    lastMessage: "По БИ проект делал?",
    image: "assets/images/icon_3.jpg",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Перов Ян",
    lastMessage: "Перезвони ему",
    image: "assets/images/icon_4.jpg",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Прокшин Михаил",
    lastMessage: "Спасибо",
    image: "assets/images/icon_5.jpg",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Цилинский Евгений",
    lastMessage: "Пойдем играть",
    image: "assets/images/icon_6.jpg",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Алешина Анастасия",
    lastMessage: "НИР завтра дедлайн",
    image: "assets/images/icon_7.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Якупов Ильшат",
    lastMessage: "Где код?!!!!!!!",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
];
