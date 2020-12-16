import 'package:login/models/location.dart';
import 'package:login/screens/home/brew_list.dart';
import 'package:login/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   /* void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }*/
    return StreamProvider < List < Location >> .value(
        value: DatabaseService().locations,
        child: Scaffold(

//START zawartość aplikacji --------------------------------------------
          body: Container(
            decoration: BoxDecoration(  
            ),
            child: LocationList()
          ),
//KONIEC zawartość aplikacji -------------------------------------------
        ),
      );
  }
}