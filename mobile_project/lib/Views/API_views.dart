// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/API_controller.dart';
import '../Models/API_models.dart';

class BooksView extends StatefulWidget {
  @override
  _BooksViewState createState() => _BooksViewState();
}

// class _BooksViewState extends State<BooksView> {
//   late Future<List<Book>> futureBooks;

//   @override
//   void initState() {
//     super.initState();
//     final controller = BooksController(
//       "EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw",
//       "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw",
//     );
//     futureBooks = controller.fetchBooks();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back),
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         // ),
//         centerTitle: true,
//         title: Image.asset(
//           'assets/Images/nyc.png',
//           width: 120,
//           height: 80,
//         ),
//       ),
//       body: FutureBuilder<List<Book>>(
//         future: futureBooks,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     // Add logic for handling item tap if needed
//                   },
//                   child: ListTile(
//                     title: Text(snapshot.data![index].title),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Author: ${snapshot.data![index].author}'),
//                         Text('Publisher: ${snapshot.data![index].publisher}'),
//                         Text('Weeks on List: ${snapshot.data![index].weeksOnList}'),
//                       ],
//                     ),
//                     leading: Image.network(
//                       snapshot.data![index].imageUrl,
//                       width: 100,
//                       height: 400,
//                       fit: BoxFit.fitHeight,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }


class _BooksViewState extends State<BooksView> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    final controller = BooksController(
      "EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw",
      "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw",
    );
    futureBooks = controller.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Images/nyc.png',
          width: 120,
          height: 80,
        ),
      ),
      body: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _launchAmazon(snapshot.data![index].amazonUrl);
                  },
                  child: ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author: ${snapshot.data![index].author}'),
                        Text('Publisher: ${snapshot.data![index].publisher}'),
                        Text('Weeks on List: ${snapshot.data![index].weeksOnList}'),
                      ],
                    ),
                    leading: Image.network(
                      snapshot.data![index].imageUrl,
                      width: 100,
                      height: 400,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Function to launch Amazon URL
  Future<void> _launchAmazon(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// Your Book and BooksController classes go here
