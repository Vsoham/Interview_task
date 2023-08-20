import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/providers/user_places.dart';
import 'package:places/screens/add_place.dart';
import 'package:places/widgets/places_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userPlaces=ref.watch(userPlacesProvider);
    void closeAppUsingSystemPop() {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Icon(Icons.arrow_back_ios),
          onPressed: closeAppUsingSystemPop,
        ),
        title: Text('Add Image/Icon'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddPlaceScreen()));
              },
              icon: Icon(
                  Icons.add,
              ),)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: PlacesList(
          
          places: userPlaces,
        ),
      ),
    );
  }
}
