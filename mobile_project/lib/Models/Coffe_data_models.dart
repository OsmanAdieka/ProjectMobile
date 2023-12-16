
// import 'Coffee_type_models.dart';
// class CoffeModel {
//   String name;
//   String image;
//   List<String> type;
//   String price;


// CoffeModel(
//   {
//     required this.name,
//     required this.image,
//     required this.type,
//     required this.price,
//     }
//     );
// }

// var coffee = [
//   CoffeModel(
//   name: "Tiramisu Coffe",
//   image: 'assets/Images/tiramisu_latte.jpg',
//   type: [coffee_models.Latte],
//   price: "25K"
//   ),

//   CoffeModel(
//   name: "Vanilla Latte x Lion Year Edition",
//   image: 'assets/Images/lion_latte.jpg',
//   type: [coffee_models.Latte],
//   price: "28K"
//   ),

//   CoffeModel(
//   name: "Creme Brulee",
//   image: 'assets/Images/creme_brulee.jpg',
//   type: [coffee_models.Creme],
//   price: "26K"
//   ),

//   CoffeModel(
//   name: "Chocolate pots de creme",
//   image: 'assets/Images/chococreme.jpg',
//   type: [coffee_models.Chocolate],
//   price: "30K"
//   )
// ];

import 'Coffee_type_models.dart';

class CoffeModel {
  String name;
  String image;
  List<String> type;
  String price;
  String description; // New field for additional information
  String imagePath; // New field for a different image

  CoffeModel({
    required this.name,
    required this.image,
    required this.type,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}

var coffee = [
  CoffeModel(
    name: "Tiramisu Coffee",
    image: 'assets/Images/tiramisu_latte.jpg',
    type: [coffee_models.Latte],
    price: "25K",
    description: "Delicious Tiramisu-flavored latte.",
    imagePath: 'assets/Images/tiramisu_latte.jpg',
  ),
  CoffeModel(
    name: "Vanilla Latte x Lion Year Edition",
    image: 'assets/Images/lion_latte.jpg',
    type: [coffee_models.Latte],
    price: "28K",
    description: "Limited edition Vanilla Latte with Lion Year artwork.",
    imagePath: 'assets/Images/lion_latte.jpg',
  ),
  CoffeModel(
    name: "Creme Brulee",
    image: 'assets/Images/creme_brulee.jpg',
    type: [coffee_models.Creme],
    price: "26K",
    description: "Irresistible Creme Brulee-flavored coffee.",
    imagePath: 'assets/Images/creme_brulee.jpg',
  ),
  CoffeModel(
    name: "Chocolate pots de creme",
    image: 'assets/Images/chococreme.jpg',
    type: [coffee_models.Chocolate],
    price: "30K",
    description: "Decadent Chocolate Pots de Creme coffee.",
    imagePath: 'assets/Images/chococreme.jpg',
  ),
];

