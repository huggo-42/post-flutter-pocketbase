import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import '../main.dart';
import '../model/post.dart';
import '../pocketbase/posts.dart';

class AddDomain extends StatefulWidget {
  const AddDomain({Key? key}) : super(key: key);

  @override
  State<AddDomain> createState() => _AddDomainState();
}

class _AddDomainState extends State<AddDomain> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

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
                  myPocketBase.createDomain().then(
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
