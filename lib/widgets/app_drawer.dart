// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezo_app/screens/admin_page.dart';
import 'package:shoezo_app/screens/login_page.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> LogoutFuncion() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool('key', false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(''),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Murshid',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          drawerWidget(
              context: context,
              name: 'Admin',
              icon: Icons.person,
              ontap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminScreen()));
              }),
          // drawerWidget(
          //   context: context,
          //   name: 'Product Chart',
          //   icon: Icons.bar_chart,
          //   ontap: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => ProductChart()));
          //   },
          // ),
          // drawerWidget(
          //   context: context,
          //   name: 'Add your Product',
          //   icon: Icons.add,
          //   ontap: () {
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (context) => AddProduct()));
          //   },
          // ),
          drawerWidget(
            context: context,
            name: 'Logout',
            icon: Icons.logout,
            ontap: () {
              LogoutFuncion();
            },
          ),
        ],
      ),
    );
  }
}

Widget DrawerBarTop() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              height: 40,
              width: 150,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                border: Border.all(color: Colors.grey),
                color: Colors.grey[200],
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.search_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5.0),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

Widget drawerWidget({
  required context,
  required String name,
  required IconData icon,
  required Function() ontap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(name),
      leading: Icon(icon),
      onTap: () {
        ontap();
      },
      tileColor: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
