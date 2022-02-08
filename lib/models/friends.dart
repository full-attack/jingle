class Friends {
  final String name, image;
  final bool isActive;

  Friends({
    this.name = '',
    this.image = '',
    this.isActive = false,
  });
}

List friendsData = [
  Friends(
    name: "Гамидов Шамсудин",
    image: "assets/images/icon_1.jpg",
    isActive: false,
  ),
  Friends(
    name: "Ворожцов Михаил",
    image: "assets/images/icon_2.jpg",
    isActive: true,
  ),
  Friends(
    name: "Пашута Павел",
    image: "assets/images/icon_3.jpg",
    isActive: false,
  ),
  Friends(
    name: "Перов Ян",
    image: "assets/images/icon_4.jpg",
    isActive: true,
  ),
  Friends(
    name: "Прокшин Михаил",
    image: "assets/images/icon_5.jpg",
    isActive: false,
  ),
];