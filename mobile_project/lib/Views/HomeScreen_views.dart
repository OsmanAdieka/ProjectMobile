// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, unnecessary_string_interpolations, unused_import, non_constant_identifier_names, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_project/Views/PromoMenu_views.dart';
import '../Controller/Searchbar_controller.dart';
import '../Models/CoffePack_data_models.dart';
import '../Models/Coffe_data_models.dart';
import '../main.dart';
import 'API_views.dart';
import 'CoffeePopup.dart';
import 'FavScreen_views.dart';
import 'ProfileScreen_views.dart';
import 'ShoppingScreen_views.dart';
import 'coffe_views.dart';
import 'package:mobile_project/Models/Trending_models.dart';

var selectedService = 0;

class ServiceWidget extends StatefulWidget {
  ServiceWidget({Key? key}) : super(key: key);

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  int selectedService = 0;

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      //Navigator.pushNamed(
      //  context,
      //  '/message',
      //  arguments: MessageArguments(message, true),
      //);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 36,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedService = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: selectedService == index
                ? Color(0xFF372E1D)
                : const Color(0xFFF6F6F6),
                border: selectedService == index ? Border.all(
                  color:
                  Color(0xFF372E1D).withOpacity(.22),
                width: 2)
                : null,
                borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text(
                trend_models.all()[index],
              style: GoogleFonts.tiltNeon(
                fontSize: 12,
                fontWeight: FontWeight.bold, color: selectedService == index
                ? Colors.white
                : Color(0xFF372E1D)),
                )
                ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: trend_models.all().length),
      );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
  child: SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        _greetings(),
        const SizedBox(
          height: 16,
        ),
        Promo(),
        const SizedBox(
          height: 20,
        ),
        SearchBarController(),
        const SizedBox(
          height: 20,
        ),
        ServiceWidget(),
        const SizedBox(
          height: 20,
        ),
        CoffeePage(pack: pack),
         const SizedBox(
          height: 20,
        ),
        _kopian()
      ],
    ),
  ),
),

    );
  }

  // ListView _kopian() {
  //   return ListView.separated(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemBuilder: (context, index) => _coffee_kopi(coffee[index]), 
  //       separatorBuilder: (context, index) => const SizedBox(
  //       height:  12,
  //     ), 
  //     itemCount: coffee.length);
  // }

  // Container _coffee_kopi(CoffeModel ModelCoffee) {
  //   return Container(
  //       padding: const EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFF6F6F6), 
  //         borderRadius: BorderRadius.circular(14),
  //         boxShadow: [
  //           BoxShadow(color:  const Color(0xFF35385A).withOpacity(.12),
  //           blurRadius: 30,
  //           offset: const Offset(0,2))
  //         ]),

  //         child: Row(children: [
  //           Container(
  //             clipBehavior: Clip.hardEdge,
  //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
  //             child: Image.asset(
  //               '${ModelCoffee.image}', 
  //           width: 100,
  //           height: 100,
  //           fit: BoxFit.fill,
  //           ),
  //           ),
  //           const SizedBox(width: 20,
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [Text(
  //               ModelCoffee.name, 
  //               style: GoogleFonts.tiltNeon(
  //                 fontSize: 15, 
  //                 fontWeight: FontWeight.bold,
  //                 color: const Color(0xFF3F3E3F)),
  //                 ),
  //                 const SizedBox(
  //                   height: 7,
  //                 ),
  //                 RichText(
  //                   text: TextSpan(
  //                     text: "${ModelCoffee.type.join(', ')}",
  //                     style: GoogleFonts.tiltNeon(
  //                       fontSize: 13, 
  //                       color: Colors.black))),
  //                       const SizedBox(
  //                         height: 7,
  //                        ),
  //             const SizedBox(
  //               height: 7,
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   "${ModelCoffee.price}",
  //                   style: GoogleFonts.tiltNeon(
  //                       color: Color(0xFF372E1D),
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 12),
  //                 ),
  //                         ],
  //                       )
  //                 ],
  //           )
  //         ],)
  //     );
  // }

ListView _kopian() {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) => _buildCoffeeItem(context, coffee[index]), // Updated here
    separatorBuilder: (context, index) => const SizedBox(
      height: 12,
    ),
    itemCount: coffee.length,
  );
}

Container _buildCoffeeItem(BuildContext context, CoffeModel modelCoffee) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: const Color(0xFFF6F6F6),
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF35385A).withOpacity(.12),
          blurRadius: 30,
          offset: const Offset(0, 2),
        )
      ],
    ),
    child: InkWell(
      onTap: () {
        _showCoffeePopup(context, modelCoffee);
      },
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              '${modelCoffee.image}',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                modelCoffee.name,
                style: GoogleFonts.tiltNeon(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF3F3E3F),
                ),
              ),
              const SizedBox(height: 7),
              RichText(
                text: TextSpan(
                  text: "${modelCoffee.type.join(', ')}",
                  style: GoogleFonts.tiltNeon(fontSize: 13, color: Colors.black),
                ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    "${modelCoffee.price}",
                    style: GoogleFonts.tiltNeon(
                      color: Color(0xFF372E1D),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}


void _showCoffeePopup(BuildContext context, CoffeModel modelCoffee) {
  showDialog(
    context: context,
    builder: (context) => CoffeePopup(modelCoffee: modelCoffee),
  );
}

//   AspectRatio _logo() {
//   return AspectRatio(
//     aspectRatio: 336 / 184,
//     child: Builder(
//       builder: (BuildContext context) {
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40),
//             color: Color.fromARGB(255, 102, 102, 102),
//           ),
//           child: Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(40),
//                 child: Image.asset(
//                   "assets/Images/tiramisu_latte.jpg",
//                   width: double.maxFinite,
//                   height: double.maxFinite,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 left: 30,
//                 bottom: 15,
//                 child: GestureDetector(
//                   onTap: () {
//                     // Navigasi ketika "Order Now" diklik
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PromoMenu()),
//                     );
//                   },
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF372E1D),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       "Order Now",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontSize: 12,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }

  Padding _greetings() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Gambar berbentuk lingkaran (CircleAvatar)
            CircleAvatar(
              backgroundImage: AssetImage('assets/Images/cafe.png'), // Ganti dengan path gambar Anda
              radius: 50, // Sesuaikan dengan ukuran yang diinginkan
            ),
            SizedBox(width: 0), // Spasi antara gambar dan teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.tiltNeon(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Kelompok 9', // Teks tambahan di bawah "Welcome Back"
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.coffee,
                color: Color(0xFF372E1D),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Color(0xFF372E1D),
                  borderRadius: BorderRadius.circular(7 / 2),
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: GoogleFonts.tiltNeon(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}

class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: InkWell(
        onTap: () {
          // Navigasi ketika gambar diklik
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PromoMenu()),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color.fromARGB(255, 102, 102, 102),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "assets/Images/tiramisu_latte.jpg",
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 30,
                bottom: 15,
                child: InkWell(
                  onTap: () {
                    // Navigasi ketika "Order Now" diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PromoMenu()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFF372E1D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Order Now",
                      style: GoogleFonts.tiltNeon(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {

  var menus = [
    FeatherIcons.heart,
    FeatherIcons.book,
    FeatherIcons.home,
    FeatherIcons.shoppingBag,
    Icons.person,

  ];
  var selectedMenu = FeatherIcons.home;

  BottomNavBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFF372E1D),
      type: BottomNavigationBarType.fixed,
      items: menus
          .map((e) =>
              BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
          .toList(),
      currentIndex: menus.indexOf(selectedMenu),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: const Color(0xFFBFBFBF),
      onTap: (index) {
        if (menus[index] == FeatherIcons.heart) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => CoffeeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
        else if (menus[index] == FeatherIcons.book) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => BooksView(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
         else if (menus[index] == FeatherIcons.shoppingBag) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ShoppingPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
         else if (menus[index] == Icons.person) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => Profile(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
      },
    );
  }
}




