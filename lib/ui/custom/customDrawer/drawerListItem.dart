import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {

  final String title;
  final IconData icondata;
  final bool focused;
  final Function changePage;

  DrawerListItem({this.title, this.icondata, this.focused, this.changePage});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: ListTile(
      leading: Icon(icondata, color: focused ? Colors.purple : Colors.black,),
      title: Text(this.title, style: TextStyle(
        fontSize: 17,
        color: focused ? Colors.purple : Colors.black
      ),),
      onTap: changePage,
    ),
    );
  }
}