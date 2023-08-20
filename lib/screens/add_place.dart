import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/providers/user_places.dart';
import 'package:places/widgets/images_input.dart';
import 'dart:io';
class AddPlaceScreen extends ConsumerStatefulWidget {
 const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController=TextEditingController();
  File? _selectedImage;
  void _saveplace()
  {
    final enteredTitle= _titleController.text;
    if(enteredTitle.isEmpty || _selectedImage==null)
      {

        return;
      }
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle,_selectedImage!);
    Navigator.of(context).pop();
  }
  @override
  void dispose()
  {
    _titleController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Photos'),
              controller: _titleController,
            ),
            const SizedBox(height: 16),
            ImageInput(onPickedimage: (image){
              _selectedImage=image;
            },),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _saveplace, child: const Text('Upload Image'))
          ],
        ),
      ),
    );
  }
}
