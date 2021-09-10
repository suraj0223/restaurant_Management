import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restro/APIRepo/apiCalls.dart';

// ignore: must_be_immutable
class BookOrderScreen extends StatelessWidget {
  BookOrderScreen({Key? key}) : super(key: key);

  TextEditingController orderNoController = TextEditingController();
  TextEditingController tableNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController ordersController = TextEditingController();

  void bookOrder({
    required String orderNo,
    required String tableno,
    required String name,
    required String contactno,
    required String orders,
    required BuildContext context,
  }) {
    Map<String, dynamic> payload = HashMap<String, dynamic>();
    payload = {
      'orderno': orderNo,
      'tableno': tableno,
      'customername': name,
      'contactno': contactno,
      'orders': orders,
      'date' : DateTime.now().toString()
    };
    ApiCalls().bookPostCall(payload: payload, collection: 'allorders').then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            value ? 'Order Booked' : 'Order not booked!!',
          ),
        ),
      );
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Order'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shrinkWrap: true,
        children: [
          TextFormField(
            controller: orderNoController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.note_add),
                hintText: 'Enter Order Number',
                labelText: 'Order No.',
                border: OutlineInputBorder()),
            onSaved: (newValue) {},
            validator: (value) {
              return value == null ? 'Enter Field to proceed' : null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: tableNoController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.add_chart),
                hintText: 'Enter Table number',
                labelText: 'Table No.',
                border: OutlineInputBorder()),
            onSaved: (newValue) {},
            validator: (value) {
              return value == null ? 'Enter Field to proceed' : null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: nameController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Customer's name",
                labelText: 'Name',
                border: OutlineInputBorder()),
            onSaved: (value) {
              print(value);
            },
            validator: (value) {
              return value == null ? 'Enter Field to proceed' : null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: contactNoController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Customer's Mobile number",
                labelText: 'Contact number',
                border: OutlineInputBorder()),
            onSaved: (value) {
              print(value);
            },
            validator: (value) {
              return value == null ? 'Enter Field to proceed' : null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: ordersController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.food_bank),
                hintText: "Enter order's seperated by comma",
                labelText: 'Orders',
                border: OutlineInputBorder()),
            onSaved: (value) {
              print(value);
            },
            validator: (value) {
              return value == null ? 'Enter Field to proceed' : null;
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(),
            child: Text('Book Order'),
            onPressed: () {
              bookOrder(
                  contactno: contactNoController.text,
                  orders: ordersController.text,
                  tableno: tableNoController.text,
                  orderNo: orderNoController.text,
                  name: nameController.text,
                  context: context,
                  );
              
              // print(orderNoController.text);
              // print(tableNoController.text);
              // print(nameController.text);
              // print(contactNoController.text);
              // print(ordersController.text);
            },
          ),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.always,
          //   decoration: const InputDecoration(
          //     icon: Icon(Icons.person),
          //     hintText: 'What do people call you?',
          //     labelText: 'Name *',
          //   ),
          //   onSaved: (value) {
          //     print(value);
          //   },
          //   validator: (value) {
          //     return value != null
          //         ? value.contains('@')
          //             ? 'Do not use the @'
          //             : null
          //         : 'Enter field to proceed';
          //   },
          // ),
        ],
      ),
    );
  }
}
