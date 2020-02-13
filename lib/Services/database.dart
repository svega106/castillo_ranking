import 'package:castillo_ranking/Models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference playerCollection =
      Firestore.instance.collection('Jugadores');

  Future updateUserData(String name, String socio, int pos, bool admin) async {
    return await playerCollection.document(uid).setData({
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
        displayName: doc.data['Nombre'] ?? '',
        socio: doc.data['Numero de Socio'] ?? '',
        position: doc.data['Posicion en el ranking'] ?? 0,
        admin: doc.data['Admin'] ?? false,
      );
    }).toList();
  }

  Stream<List<Player>> get players {
    return playerCollection.snapshots().map(_playerListFromSnapshot);
  }


}
