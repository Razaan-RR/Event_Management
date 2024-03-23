import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'CreateEventsFirestore.dart'; // Ensure this import is correct for your project structure

class UpcomingEventsPage extends StatelessWidget {
  const UpcomingEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
        backgroundColor: Color(0xFFB9E5F8),
      ),
      backgroundColor: Color(0xFFB9E5F8),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreCreateEvents().getEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<DocumentSnapshot> eventsList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: eventsList.length,
              itemBuilder: (context, index) {
                var eventData = eventsList[index].data() as Map<String, dynamic>;
                var title = eventData['title'];
                var imageUrl = eventData['imageUrl'];
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 30),                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            imageUrl,
                            width: 300,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "See Registered List",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No upcoming events found'));
          }
        },
      ),
    );
  }
}
