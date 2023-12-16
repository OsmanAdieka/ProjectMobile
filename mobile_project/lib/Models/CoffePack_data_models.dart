// ignore_for_file: file_names
import 'CoffePack_type_models.dart';
class Packmodel {
  String name;
  String image;
  List<String> type;
  String price;
  String info;
  String origin;
  String taste;
  

Packmodel(
  {
    required this.name,
    required this.image,
    required this.type,
    required this.price,
    required this.info,
    required this.origin,
    required this.taste,
    }
    );
}
  
var pack = [
  Packmodel(
  name: "Robusta Pack", 
  image: 'assets/Images/robusta.jpg', 
  type: [coffeepack_models.Robusta], 
  price: "30K",
  origin: "Kongo, West Africa",
  info: "Biji robusta memiliki bentuk bulat, berbeda dengan biji arabika yang pipih dan aroma robusta sering dianggap lebih kuat, dengan nuansa bumi dan kayu",
  taste: "Rasa lebih pahit dan asam, dengan sentuhan coklat dan kayu.",

  ),

  Packmodel(
  name: "Touchy. P Luwak Edition", 
  image: 'assets/Images/touchypack.jpg', 
  type: [coffeepack_models.Luwak],  
  price: "35K",
  origin: "Indonesia",
  info: "Luwak sering dianggap kopi mahal dengan aroma yang lembut ala fermentasi alami",
  taste: "Rasa lebih lembut dan tidak asam",
  ),

  Packmodel(
  name: "Arabica Pack", 
  image: 'assets/Images/arabica.jpg', 
  type: [coffeepack_models.Arabica], 
  price: "35K",
  origin: "Ethiopian Mountains",
  info: "Arabica dianggap jenis kopi yang lebih halus, rendah kafein, dan memiliki aroma kompleks dengan buah, bunga, dan gula",
  taste: "Rasa lebih lembut, asam ringan, dan sering kali sedikit manis",
  ),
];
  
