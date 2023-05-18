import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  PickedFile? imageFile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            children: [
          imageProfile(),
          const SizedBox(height: 20),
          nameTextField(),
          const SizedBox(height: 20),
          professionTextField(),
          const SizedBox(height: 20),
          dobField(),
          const SizedBox(height: 20),
          titleTextField(),
          const SizedBox(height: 20),
          aboutTextField()
        ]));
  }

  Widget imageProfile() {
    return Center(
        child: Stack(children: [
      ClipOval(
          child: imageFile != null
              ? Image.file(
                  File(
                    imageFile?.path ?? '',
                  ),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  "assets/userImage.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                )),
      Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => bottomSheet());
              },
              child:
                  const Icon(Icons.camera_alt, color: Colors.teal, size: 28.0)))
    ]));
  }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Text("Choose Profile photo", style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                ),
                child: Icon(
                  Icons.camera,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                ),
                child: Icon(
                  Icons.image,
                  color: Colors.grey[900],
                ),
              )
            ],
          )
        ]));
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
        decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2)),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            labelText: "Name",
            helperText: "Name can\'t be empty",
            hintText: "Dev Stack"));
  }

  Widget professionTextField() {
    return TextFormField(
        decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2)),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            labelText: "Profession",
            helperText: "Profession can\'t be empty",
            hintText: "Full Stack Developer"));
  }

  Widget dobField() {
    return TextFormField(
        decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2)),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            labelText: "Date Of Birth",
            helperText: "Provide DOB on dd/mm/yyyy",
            hintText: "01/01/2020"));
  }

  Widget titleTextField() {
    return TextFormField(
        decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2)),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            labelText: "Title",
            helperText: "It can\'t be empty",
            hintText: "Flutter Developer"));
  }

  Widget aboutTextField() {
    return TextFormField(
        maxLines: 4,
        decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2)),
            labelText: "About",
            helperText: "Write about yourself",
            hintText: "I am Dev Stack"));
  }
}
