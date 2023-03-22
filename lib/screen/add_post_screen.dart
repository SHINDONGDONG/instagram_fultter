import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_fultter/providers/user_provider.dart';
import 'package:instagram_fultter/utils/colors.dart';
import 'package:instagram_fultter/utils/utils.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  //언제 들어올지 모르는 파일
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  //언제 선택될지 모르는 카메라,갤러리 등
  _selectImage(BuildContext context) async {
    return showDialog(context: context, builder: (context) {
      //다이어로그 흰색화면.
      return SimpleDialog(
        title: const Text("Create a Post"),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: Text("take a photo"),
            onPressed: () async{
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera,);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: Text("Choose from Gallery"),
            onPressed: () async{
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery,);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: Text("Cancel"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )

        ],
      );
    });
  }


  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null? Center(
      child: IconButton(
        icon: Icon(Icons.upload),
        onPressed: ()=>_selectImage(context),
      ),
    ):
  Scaffold(
    appBar: AppBar(
      backgroundColor: mobileBackgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (){},
      ),
      title: const Text('Post to'),
      centerTitle: false,
      actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Post',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    ),
    body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl,),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*.4,
            child: TextField(
              controller: _descriptionController,
              decoration:InputDecoration(
                hintText: "Write a caption...",
                border: InputBorder.none
              ),
              maxLines:8,
            ),),
            SizedBox(
              height: 45,
              width: 45,
              child: AspectRatio(
                aspectRatio: 487/451,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(_file!),
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                    )
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ],
    ),
  );
  }
}
