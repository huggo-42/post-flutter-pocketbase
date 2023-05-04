import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import '../model/post.dart';

class MyPocketBase {
  final pb = PocketBase('http://af0e-186-236-36-192.sa.ngrok.io');

  Future getPosts() async {
    // final records = await pb.collection('posts').getFullList(
    //   sort: '-created',
    // );
    final records = await pb.collection('domains').getFullList(
      sort: '-created',
    );
    // print(records);
    return records;
  }

  Future createPost(String title, String desc) async {
    final body = <String, dynamic>{
      "title": title,
      "content": desc
    };
    // print(body);

    final record = await pb.collection('posts').create(body: body);
    print(record);

  }

  Future createDomain() async {
    final body = <String, dynamic>{
      "user": "h4wvzza79au3zww",
      "title": "001",
      "description": "001 description",
      "register_date": "2023-04-01 10:00:00.123Z",
      "register_time": 1,
      "domain": "001.com",
      "renew_url": "001.com/renew",
      "price": 10,
    };

    final record = await pb.collection('domains').create(body: body);
  }
}
