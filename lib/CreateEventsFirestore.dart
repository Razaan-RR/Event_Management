import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCreateEvents {
  // get collection of events
  final CollectionReference events = FirebaseFirestore.instance.collection('events');

  //CREATE: add an event
  Future<void> addEvent(String title, String location, DateTime date, String description, String fee, String imageUrl) {
    String formattedDate = '${date.day}-${date.month}-${date.year}';

    return events.add({
      'title': title,
      'location': location,
      'date': formattedDate,
      'description': description,
      'fee': fee,
      'imageUrl': imageUrl,
      'timestamp': Timestamp.now(),
    });
  }

//READ: get events from database
Stream<QuerySnapshot> getEvents(){
    final eventStream = events.orderBy('timestamp', descending: true).snapshots();
    return eventStream;
}


//UPDATE:

//DELETE:
}
