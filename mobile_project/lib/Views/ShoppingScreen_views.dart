// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/Views/FavScreen_views.dart';
import 'package:mobile_project/Views/Order_views.dart';
import 'package:mobile_project/Views/ProfileScreen_views.dart';
import '../Controller/DatabaseController.dart';
import 'HomeScreen_views.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  late DatabaseController databaseController;
  final videoURL = "https://youtu.be/Nu8kIIL-CDA?si=kEuOJr3ePZ13BoI7";
  late YoutubePlayerController _controller;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _documentIdController = TextEditingController();
  TextEditingController _documentIdUpdateController = TextEditingController();
  TextEditingController _newNamaController = TextEditingController();
  TextEditingController _newJumlahController = TextEditingController();

    @override
  void initState() {
    super.initState();
    databaseController = DatabaseController();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        forceHD: false,
        loop: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 400,
            height: 850,
            margin: EdgeInsets.symmetric(vertical: 0),
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0),
                // Container for the Twitter header image
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage('assets/Images/cth.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // YoutubePlayer
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: false,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Menu'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _jumlahController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Quantity'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _documentIdController,
                  decoration: InputDecoration(labelText: 'Document ID to Delete'),
                ),
                TextField(
                  controller: _documentIdUpdateController,
                  decoration: InputDecoration(labelText: 'Document ID to Update'),
                ),
                SizedBox(height: 20),
                // Row of buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Column for the first set of buttons
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Call the function to save data to the database
                            await saveToDatabase();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.brown,
                          ),
                          child: Text(
                            'ORDER NOW!',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            // Call the function to delete data from the database
                            await deleteFromDatabase();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.brown,
                          ),
                          child: Text(
                            'DELETE DATA!',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                    // Column for the second set of buttons
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Call the function to read all data from the database
                            await displayDocumentsPopup();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.brown,
                          ),
                          child: Text(
                            'READ DATA!',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            // Show the update data dialog
                            await showUpdateInputDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.brown,
                          ),
                          child: Text(
                            'UPDATE DATA!',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
  // Function to save data to the database
  Future<void> saveToDatabase() async {
    String name = _nameController.text;
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;

    // Call the function to store user data in the database
    databaseController.createDocument(name, jumlah);

    // Show a snackbar to inform the user that the data has been saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data has been successfully saved to the database'),
      ),
    );
  }

  // Function to delete data from the database
   Future<void> deleteFromDatabase() async {
    String documentId = _documentIdController.text;

    // Call the function to delete data from the database
    databaseController.deleteDocument(documentId);

    // Show a snackbar to inform the user that the data has been deleted
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data has been successfully deleted from the database'),
      ),
    );
  }


// Function to display documents in a popup
  Future<void> displayDocumentsPopup() async {
    try {
      final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('656707c5b0ab98f584e8');

      final databases = Databases(client);

      final page1 = await databases.listDocuments(
        databaseId: 'osmandatabase',
        collectionId: 'osmancollection',
        queries: [
          Query.limit(25),
        ],
      );

      // Show the document details in a dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Available Menu', style: TextStyle(color: Colors.brown),
            textAlign: TextAlign.center,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var document in page1.documents)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama: ${document.data['nama']}', style: TextStyle(color: Colors.brown),),
                      Text('Jumlah: ${document.data['jumlah']}', style: TextStyle(color: Colors.brown),),
                      SizedBox(height: 10),
                    ],
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: TextStyle(color: Colors.brown),),
              ),
            ],
            backgroundColor: Colors.white,
          );
        },
      );
    } catch (e) {
      // Show a snackbar for any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error displaying documents: $e'),
        ),
      );
    }
  }

 Future<void> updateDocument(String databaseId, String collectionId, String documentId, String newNama, int newJumlah) async {
    late Databases databases;

    var client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('656707c5b0ab98f584e8');

    databases = Databases(client);

    try {
      await databases.updateDocument(
        databaseId: 'osmandatabase',
        collectionId: 'osmancollection',
        documentId: documentId,
        data: {
          'nama': newNama,
          'jumlah': newJumlah,
        },
      );
    } catch (e) {
      print('Error updating document: $e');
      rethrow; // Rethrow the exception for the caller to handle if needed
    }
  }

Future<void> showUpdateInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update Data'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _documentIdUpdateController,
              decoration: InputDecoration(labelText: 'Document ID'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Close the first dialog
              Navigator.of(context).pop();

              // Show the second dialog for entering new data
              await showUpdateDataDialog(context, _documentIdUpdateController.text);
            },
            child: Text('Next'),
          ),
        ],
      );
    },
  );
}

Future<void> showUpdateDataDialog(BuildContext context, String documentId) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update Data for Document ID: $documentId'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _newNamaController,
              decoration: InputDecoration(labelText: 'New Menu'),
            ),
            TextField(
              controller: _newJumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'New Quantity'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Get the new data from the text controllers
              String newNama = _newNamaController.text;
              int newJumlah = int.tryParse(_newJumlahController.text) ?? 0;

              // Call the function to update data in the database
              await updateDocument(
                'osmandatabase',
                'osmancollection',
                documentId,
                newNama,
                newJumlah,
              );

              Navigator.of(context).pop(); // Close the dialog after updating
            },
            child: Text('Save'),
          ),
        ],
      );
    },
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
  var selectedMenu = FeatherIcons.shoppingBag;

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
        } else if (menus[index] == FeatherIcons.heart) {
          // Tidak perlu menambahkan BottomNavBar di sini
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
          // Tidak perlu menambahkan BottomNavBar di sini
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => OrderPage(),
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
        else if (menus[index] == FeatherIcons.home) {
          // Tidak perlu menambahkan BottomNavBar di sini
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
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
          // Tidak perlu menambahkan BottomNavBar di sini
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
