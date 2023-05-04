import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import '../main.dart';
import '../model/post.dart';
import '../pocketbase/posts.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final pb22 = PocketBase('http://af0e-186-236-36-192.sa.ngrok.io');
  MyPocketBase myPocketBase = MyPocketBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Post')),
        body: Form(
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: 'Content',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  myPocketBase.createPost('001 title', '001 desc').then(
                      (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage())));
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ));
  }
}
