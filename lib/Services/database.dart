import 'package:castillo_ranking/Models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference playerCollection =
      Firestore.instance.collection('Jugadores');

  Future updateUserData(
      String id, String name, String socio, int pos, bool admin) async {
    return await playerCollection.document(uid).setData({
      'Id': id,
      'Nombre': name,
      'Numero de Socio': socio,
      'Posicion en el Ranking': pos,
      'Admin': false,
    });
  }

  // player list from snapshot
  List<Player> _playerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Player(
        id: doc.documentID,
        displayName: doc.data['Nombre'] ?? '',
        socio: doc.data['Numero de Socio'] ?? '',
        position: doc.data['Posicion en el ranking'] ?? 0,
        admin: doc.data['Admin'] ?? false,
      );
    }).toList();
  }

  //User Data from snapshot
  Player _playerDataFromSnapshot(DocumentSnapshot snapshot) {
    return Player(
        id: uid,
        displayName: snapshot.data['Nombre'] ?? '',
        socio: snapshot.data['Numero de Socio'] ?? '',
        position: snapshot.data['Posicion en el ranking'] ?? 0,
        admin: snapshot.data['Admin'] ?? false);
  }

  Stream<List<Player>> get players {
    return playerCollection.snapshots().map(_playerListFromSnapshot);
  }

  //Get user doc
  Stream<Player> get userData {
    return playerCollection
        .document(uid)
        .snapshots()
        .map(_playerDataFromSnapshot);
  }
}
