import 'package:login/models/location.dart';
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {

  final Location location;
  LocationTile({
    this.location
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0.0),
          child:
          Column(
            children: [
              ListTile(
                title: Text(location.region),
                subtitle: Text(location.rock),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox( width: 50.0, height: 70.0,
                    child: Column(
                      children: [
                        Icon(Icons.wb_sunny, size: 40, color: Colors.black),
                        Text('Sunny'),
                      ],
                    ),
                  ),

                  SizedBox( width: 50.0, height: 70.0,
                    child: Column(
                      children: [
                        Icon(Icons.laptop_windows, size: 40, color: Colors.black),
                        Text('Sunny'),
                      ],
                    ),
                  ),

                  SizedBox( width: 50.0, height: 70.0,
                    child: Column(
                      children: [
                        Icon(Icons.desktop_windows, size: 40, color: Colors.black),
                        Text('Sunny'),
                      ],
                    ),
                  ),

                  SizedBox( width: 50.0, height: 70.0,
                    child: Column(
                      children: [
                        Icon(Icons.cloud, size: 40, color: Colors.black),
                        Text('Sunny'),
                      ],
                    ),
                  ),
                ],

              ),
              SizedBox(height: 5, ),
            ],
          ),
        ),
    );
  }
}