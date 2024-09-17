// my_posts.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reuse/path/path_provider.dart';

class newwwpostsss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Posts',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Righteous',
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return ListView.builder(
            itemCount: postProvider.posts.length,
            itemBuilder: (context, index) {
              final post = postProvider.posts[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.productImage),
                ),
                title: Text(post.productName),
                subtitle: Text('Price: Rs. ${post.price}\nAddress: ${post.address}'),
              );
            },
          );
        },
      ),
    );
  }
}
