


// post_provider.dart

import 'package:flutter/material.dart';

import '../modal/modal.dart';


class PostProvider with ChangeNotifier {
  List<PostModel> _posts = [];

  List<PostModel> get posts => _posts;

  void addPost(PostModel post) {
    _posts.add(post);
    notifyListeners();
  }
}
