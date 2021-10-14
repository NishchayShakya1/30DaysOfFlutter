// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/utils/credentials.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://avatars.githubusercontent.com/u/75979530?v=4";
    return Drawer(
      child: Container(
        color: context.theme.canvasColor,
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: context.theme.canvasColor),
                margin: EdgeInsets.zero,
                accountName: Text(
                  MyCred.name,
                  style: TextStyle(color: context.theme.accentColor),
                ),
                accountEmail: Text(MyCred.mail,
                    style: TextStyle(color: context.theme.accentColor)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading:
                    Icon(CupertinoIcons.home, color: context.theme.accentColor),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: context.theme.accentColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading: Icon(CupertinoIcons.profile_circled,
                    color: context.theme.accentColor),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: context.theme.accentColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading:
                    Icon(CupertinoIcons.mail, color: context.theme.accentColor),
                title: Text(
                  "E-mail me",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: context.theme.accentColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
