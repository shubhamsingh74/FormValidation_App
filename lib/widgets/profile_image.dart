import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }
  // void clearImage() {
  //   setState(() {
  //     image = null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: image == null
            ? const Icon(Icons.ac_unit_sharp)
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  fit:BoxFit.fill,
                  image!,
                )),
      ),
      Positioned(
        bottom: 7,
        right: 7,
        child: InkWell(
          onTap: pickImage,
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              )),
        ),
      )
    ]);
  }
}
