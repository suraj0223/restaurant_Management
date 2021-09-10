import 'package:flutter/material.dart';
import 'package:restro/screens/bookOrder.dart';
import 'package:restro/screens/bookTable.dart';
import 'package:restro/widgets/booked_tables_list.dart';
import 'package:restro/widgets/past_order_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        //add somechild in drawer
        drawer: Drawer(),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Feed and Food',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Past Orders',
                icon: Icon(
                  Icons.ac_unit_rounded,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                text: 'Booked Tables',
                icon: Icon(
                  Icons.table_chart,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          PastOrderList(),
          BookedTablesList(),
        ]),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
                context: context,
                backgroundColor: Colors.blue.shade100,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.radio_button_checked),
                            SizedBox(width: 10),
                            InkWell(
                              child: Text(
                                ' Book orders',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueAccent),
                              ),
                              onTap: () {
                                // takes to book table screen
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BookOrderScreen()));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.radio_button_checked),
                            SizedBox(width: 10),
                            InkWell(
                              child: Text(' Book Table',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blueAccent)),
                              onTap: () {
                                // takes to book table screen
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BookTableScreen()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            tooltip: 'Add',
            child: Icon(Icons.add),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
