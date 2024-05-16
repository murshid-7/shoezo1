import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoezo_app/functions/product_functions.dart';
import 'package:shoezo_app/models/shoe_model.dart';

class EditShoeScreen extends StatefulWidget {
  String name;
  String price;
  String? discription;
  int index;
  dynamic imagePath;
  EditShoeScreen({
    super.key,
    required this.name,
    required this.price,
    this.discription,
    required this.index,
    required this.imagePath,
  });

  @override
  State<EditShoeScreen> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditShoeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  File? selectedImage;
  @override
  void initState() {
    _nameController = TextEditingController(text: widget.name);
    _priceController = TextEditingController(text: widget.price);
    selectedImage = widget.imagePath != '' ? File(widget.imagePath) : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Details',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 90,
                backgroundImage: selectedImage != null
                    ? FileImage(selectedImage!)
                    : FileImage(File(widget.imagePath!)),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                style: const ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  pickImageGallery();
                },
                label: const Text(
                  'Gallery',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.image),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter the Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter the Price',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  editAll();

                  Navigator.pop(context);
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editAll() async {
    final name = _nameController.text.trim();
    final price = _priceController.text.trim();
    final image = selectedImage!.path;
    if (name.isNotEmpty || price.isNotEmpty) {
      final update = ShoeModel(
        id: 1,
        name: name,
        image: image,
        price: price,
        quantity: 1,
        catagory: '',
      );
      editShoes(widget.index, update);
    } else {
      return;
    }
  }

  pickImageGallery() async {
    final returntheImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returntheImage != null) {
      setState(() {
        selectedImage = File(returntheImage.path);
      });
    }
  }
}
