import 'package:contact_manager/Controller/home_screen_controller.dart';
import 'package:contact_manager/Utils/color_constants.dart';
import 'package:contact_manager/Utils/image_constants.dart';
import 'package:contact_manager/View/Add_Contacts/add_contacts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await HomeScreenController.getAllContacts();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primarybg,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddContacts()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorConstants.primarybg,
        actions: [
          Row(
            children: [
              Icon(
                Icons.search,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    HomeScreenController.getAllContacts();
                    setState(() {});
                  },
                  icon: Icon(Icons.ac_unit))
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeScreenController.contactsList.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Image.asset(ImageConstants.homepage),
                      Text("You have no contacts yet")
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                            title: Text(HomeScreenController.contactsList[index]
                                ["name"]),
                            subtitle: Text(HomeScreenController
                                .contactsList[index]["phone"]
                                .toString()),
                          ),
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemCount: HomeScreenController.contactsList.length),
                )
        ],
      ),
    );
  }
}
