import 'package:login/models/location.dart';
import 'package:login/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationList extends StatefulWidget {
  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  @override
  Widget build(BuildContext context) {

    final location = Provider.of<List<Location>>(context) ?? [];

    return ListView.builder(
      itemCount: location.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return LocationTile(location: location[index]);
      },
    );
  }
}