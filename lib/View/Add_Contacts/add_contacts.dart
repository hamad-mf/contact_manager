import 'package:contact_manager/Controller/home_screen_controller.dart';
import 'package:contact_manager/Utils/color_constants.dart';
import 'package:contact_manager/View/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mobilenocontroller = TextEditingController();
    TextEditingController _namecontroller = TextEditingController();
    TextEditingController _surnamecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: ColorConstants.primarybg,
      appBar: AppBar(
        backgroundColor: ColorConstants.primarybg,
        title: Text(
          "Add",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await HomeScreenController.addContact(
                    _namecontroller.text, _mobilenocontroller.text);
                setState(() {});
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icon(Icons.save_as))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              controller: _mobilenocontroller,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                // floatingLabelBehavior: FloatingLabelBehavior
                //     .always,
                hintText: "Enter Name",

                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                labelText: "Surname",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                // floatingLabelBehavior: FloatingLabelBehavior
                //     .always,
                hintText: "Enter Surname",

                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _surnamecontroller,
              decoration: InputDecoration(
                labelText: "Mobile Number",
                labelStyle: TextStyle(
                  color: Colors.black,
                ), // Set the label text
                floatingLabelBehavior: FloatingLabelBehavior
                    .always, // Ensure label is always visible
                hintText: "10 digit mobile number",
                prefix: Text(
                  "+91  |  ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}
