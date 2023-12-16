// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Models/Coffe_data_models.dart';

class CoffeePopup extends StatefulWidget {
  final CoffeModel modelCoffee;

  CoffeePopup({required this.modelCoffee});

  @override
  _CoffeePopupState createState() => _CoffeePopupState();
}
class _CoffeePopupState extends State<CoffeePopup> {
  bool isOrdering = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            !isOrdering
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      '${widget.modelCoffee.imagePath}',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  )
                : Center(
                    child: Image.asset(
                      'assets/Gif/happycat.gif',
                      width: 100,
                      height: 100,
                    ),
                  ),
            const SizedBox(height: 16),
            Text(
              widget.modelCoffee.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3F3E3F),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Type: ${widget.modelCoffee.type.join(', ')}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Price: ${widget.modelCoffee.price}",
              style: TextStyle(
                color: const Color(0xFF372E1D),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Additional Information:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.modelCoffee.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showGifPopup(context);
                  },
                  child: Text(
                    "Grab This",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _orderCoffee() {
    setState(() {
      isOrdering = true;
    });

    // Simulate an order processing delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isOrdering = false;
        _showAdditionalInfoPopup(context);
      });
    });
  }

  void _showGifPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/Gif/happycat.gif',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                "MAKAZII MANIEZ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAdditionalInfoPopup(BuildContext context) {
    // Implement the logic to show additional information popup here
  }
}

// class _CoffeePopupState extends State<CoffeePopup> {
//   bool isOrdering = false;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             !isOrdering
//                 ? ClipRRect(
//                     borderRadius:
//                         BorderRadius.circular(12.0), // Add border radius
//                     child: Image.asset(
//                       '${widget.modelCoffee.imagePath}',
//                       width: 200,
//                       height: 200,
//                       fit: BoxFit.fill,
//                     ),
//                   )
//                 : Center(
//                     child: Image.asset(
//                       'assets/Gif/happycat.gif',
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//             const SizedBox(height: 16),
//             Text(
//               widget.modelCoffee.name,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFF3F3E3F),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "Type: ${widget.modelCoffee.type.join(', ')}",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "Price: ${widget.modelCoffee.price}",
//               style: TextStyle(
//                 color: const Color(0xFF372E1D),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "Additional Information:",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               widget.modelCoffee.description,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     "Close",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _orderCoffee();
//                   },
//                   child: Text(
//                     "Order This",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _orderCoffee() {
//     setState(() {
//       isOrdering = true;
//     });

//     // Simulate an order processing delay
//     Future.delayed(Duration(seconds: 3), () {
//       setState(() {
//         isOrdering = false;
//         // You can add any additional logic here after the order is complete
//       });
//     });
//   }
// }
