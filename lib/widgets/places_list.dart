import 'package:flutter/material.dart';
import 'package:places/models/place.dart';
import 'package:places/screens/place_detail.dart';
class PlacesList extends StatelessWidget {
 const PlacesList({super.key,required this.places});
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if(places.isEmpty)
      {
        return Center(
          child: Text('No pictures added yet',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blue)),
        );
      }
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx,index)=>ListTile(
          // leading: CircleAvatar(
          //   radius: 26,
          //   backgroundImage: FileImage(places[index].image),
          // ),
          title: Text(places[index].title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blue),),
          subtitle: SizedBox(
            width: double.infinity,
          height: 500,
          child: Image.file(places[index].image),
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PlaceDetailScreen(place: places[index])));
          },
        )
    );
  }
}
