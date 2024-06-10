// import 'package:mongo_dart/mongo_dart.dart';

// class MongoService {
//   final String databaseName = 'test'; // Replace with your database name
//   final String collectionName = 'blogs'; // Replace with your collection name
//   Db? _db;

//   Future<void> connectToMongoDB() async {
//     final uri =
//         'mongodb+srv://armaankhan:armaan242@cluster.mongodb.net/$databaseName?retryWrites=true&w=majority';

//     try {
//       _db = Db(uri);
//       await _db!.open();
//       print('Connected to MongoDB');
//     } catch (e) {
//       print('Failed to connect to MongoDB: $e');
//     }
//   }

//   Db get database => _db!;
// }
