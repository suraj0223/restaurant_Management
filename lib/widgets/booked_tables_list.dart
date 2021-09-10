import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restro/APIRepo/apiCalls.dart';
import 'package:restro/screens/bookTable.dart';

class BookedTablesList extends StatelessWidget {
  BookedTablesList();

  @override
  Widget build(BuildContext context) {
    dynamic data = ApiCalls().getDataFromDb(collection: 'alltablebooked');
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
                    tileColor: Colors.pink.shade50.withOpacity(0.1),
                    title: Text(mp[index]['customername']),
                    subtitle: Text(mp[index]['date']),
                    leading: CircleAvatar(
                      backgroundColor: Colors.yellowAccent.withOpacity(0.1),
                      child: Icon(Icons.brunch_dining_outlined, size: 25,),
                    ),
                  );
                });
          } else
            return Center(
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.post_add_sharp,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookTableScreen()));
                },
              ),
            );
        });
  }
}
