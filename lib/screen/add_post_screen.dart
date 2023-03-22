import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_fultter/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
/*
    return Center(
      child: IconButton(
        icon: Icon(Icons.upload),
        onPressed: (){},
      ),
    );
*/
  return Scaffold(
    appBar: AppBar(
      backgroundColor: mobileBackgroundColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
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
            const CircleAvatar(
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1679311994617-c3c9dbe09d01?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*.4,
            child: const TextField(
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1679311994617-c3c9dbe09d01?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
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
