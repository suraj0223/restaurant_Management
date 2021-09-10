import 'package:flutter/material.dart';
import 'package:restro/APIRepo/apiCalls.dart';
import 'package:restro/screens/bookOrder.dart';

class PastOrderList extends StatelessWidget {
  PastOrderList();

  @override
  Widget build(BuildContext context) {
    dynamic data = ApiCalls().getDataFromDb(collection: 'allorders');
    return FutureBuilder(
      future: data,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snap.hasData) {
          dynamic dt = snap.data;
          return ListView.builder(
              itemCount: dt.length,
              itemBuilder: (context, index) {
                dynamic mp = snap.data;
                return ListTile(
                  tileColor: Colors.teal.shade200.withOpacity(0.1),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade50.withOpacity(0.1),
                    child: Icon(Icons.brunch_dining_outlined,size: 25,),
                  ),
                  title: Text(mp[index]['customername']),
                  subtitle: Text(mp[index]['date']),
                );
              });
        } else
          return Center(
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.purple.shade100.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.note_add_outlined,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BookOrderScreen()));
              },
            ),
          );
      },
    );
  }
}
