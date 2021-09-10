
import 'package:flutter/material.dart';
import 'package:restro/APIRepo/apiCalls.dart';

// ignore: must_be_immutable
class BookTableScreen extends StatelessWidget {
  BookTableScreen({Key? key}) : super(key: key);

  TextEditingController tableNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController staffNameController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController totalMemberController = TextEditingController();

  void bookOrder({
    required String tableno,
    required String customername,
    required String contactno,
    required String staffname,
    required String totalmembers,
    required BuildContext context,
  }) {
    Map<String, dynamic> payload = Map<String, dynamic>();
    payload = {
      'tableno': tableno,
      'customername': customername,
      'staffname': staffname,
      'contactno': contactno,
      'totalmembers': totalmembers,
      'date': DateTime.now().toIso8601String()
    };
    ApiCalls()
        .bookPostCall(payload: payload, collection: 'alltablebooked')
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            value ? 'Table Booked' : 'Table not booked!!',
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
        title: Text('Book Tables'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shrinkWrap: true,
        children: [
          TextFormField(
            controller: tableNoController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.note_add),
                hintText: 'Enter Table no. that is not in use',
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
            controller: totalMemberController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.food_bank),
                hintText: "Enter Total members on the table",
                labelText: 'Total members',
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
            controller: staffNameController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                icon: Icon(Icons.food_bank),
                hintText: "Enter Your Name",
                labelText: 'Staff name',
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
            child: Text('Reserve Table'),
            onPressed: () {

              bookOrder(
                contactno: contactNoController.text,
                context: context,
                customername: nameController.text,
                staffname: staffNameController.text,
                tableno: tableNoController.text,
                totalmembers: totalMemberController.text,
              );

              // print(tableNoController.text);
              // print(nameController.text);
              // print(contactNoController.text);
              // print(totalMemberController.text);
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
