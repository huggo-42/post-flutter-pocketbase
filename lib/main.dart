import 'package:flutter/material.dart';
import 'package:post_flutter_pocketbase/pages/addDomain.dart';
import 'package:post_flutter_pocketbase/pages/addPost.dart';
import 'model/post.dart';
import 'pocketbase/posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter w/ pocketbase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    MyPocketBase myPocketBase = MyPocketBase();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter w/ pocketbase'),
        actions: [
          IconButton(
            onPressed: () {
              // reload page
              setState(() {
                // pocketbase
                myPocketBase.getPosts();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
          future: myPocketBase.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final domains = snapshot.data;
                return Center(
                  child: Column(
                    children: [
                      for (int i = 0; i < domains.length; i++)
                        ListTile(
                          title: Text(domains[i].data['domain']),
                          subtitle:
                              Text(domains[i].data['description'].toString()),
                        ),
                    ],
                  ),
                );
                // final records = snapshot.data;
                // return ListView.builder(
                // itemCount: records.length + 1,
                // itemBuilder: (context, index) {
                // if (index == records.length) {
                // return Center(
                // child: InkWell(
                // onTap: () {
                // // reload page
                // setState(() {});
                // },
                // child: Container(
                // padding: const EdgeInsets.all(10),
                // decoration: BoxDecoration(
                // color: Colors.lightGreen,
                // borderRadius: BorderRadius.circular(100)),
                // child: const Icon(Icons.refresh,
                // size: 28),
                // ),
                // ),
                // );
                // }
                // final record = records[index].data;
                // return ListTile(
                // title: Text(record['title']),
                // subtitle: Text(record['content']),
                // );
                // },
                // );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPostPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddDomain()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
              break;
            default:
              print('default');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Domain'),
          BottomNavigationBarItem(

              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}
