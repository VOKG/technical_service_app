import 'package:flutter/material.dart';

import 'BottomTabbarExample.dart';
import 'DataTableWidget.dart';
import 'ExpansionPanelWidget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('A'),
          backgroundColor: Colors.yellow,
        ),
        CircleAvatar(
          child: Text('B'),
          backgroundColor: Colors.red,
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        CustomList(Icons.person,'Profile',() =>Navigator.of(context).push(_NewPage2(3))),

        CustomList(Icons.notifications,'Notification',() =>Navigator.of(context).push(_NewPage2(3))),

        CustomList(Icons.settings,'Settings',() =>Navigator.of(context).push(_NewPage2(3))),

        CustomList(Icons.lock,'Log Out',() =>Navigator.of(context).push(_NewPage2(3))),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Drawer example'),
      ),
      body:  BottomTabbarExample(),
      drawer: Drawer(
        child: drawerItems,
      ),
    );
  }
}

// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
          return ExpansionPanelWidget();
          /*Scaffold(
      appBar: AppBar(
        title: Text('Page $id'),
        elevation: 1.0,
      ),
      body: Center(
        child: Text('Page $id'),
      ),
    );*/
        });
}
// страница для перехода на новое окно
class _NewPage2 extends MaterialPageRoute<Null> {
  _NewPage2(int id)
      : super(builder: (BuildContext context) {
          return DataTableWidget();
          /*Scaffold(
      appBar: AppBar(
        title: Text('Page $id'),
        elevation: 1.0,
      ),
      body: Center(
        child: Text('Page $id'),
      ),
    );*/
        });
}
// Используется для стилизации листа
class CustomList extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;
  CustomList(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.red,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          height: 40,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                ),
                Icon(Icons.arrow_right),
              ]
          )
          ,
        ),
      ),
    );
  }
}
