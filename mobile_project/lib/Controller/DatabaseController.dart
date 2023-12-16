
import 'package:appwrite/appwrite.dart';
import 'package:mobile_project/Controller/ClientController.dart';

class DatabaseController extends ClientController {

void createDocument(String nama, int jumlah) async {
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('656707c5b0ab98f584e8');

  final databases = Databases(client);

  final response = await databases.createDocument(
    databaseId: 'osmandatabase',
    collectionId: 'osmancollection',
    data: {
      'nama': nama,
      'jumlah': jumlah,
    }, documentId: '',
  );

  print('Document created: ${response.data}');
}

  Future<void> updateDocument(String databaseId, String collectionId, String documentId, String newNama, int newJumlah) async {
    late Databases databases;

    client = Client()
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

  void deleteDocument(String documentId) async {
    final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('656707c5b0ab98f584e8');

  final databases = Databases(client);

  final response = await databases.deleteDocument(
     databaseId: 'osmandatabase',
    collectionId: 'osmancollection',
    documentId: documentId);
    print('Document Deleted: ${response.data}');
  }

  void listDocuments() async {
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
    for (var document in page1.documents) {
      print(document);
    }
  }
}