import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/api.dart'; // Make sure to replace with your API URL.
import '../models/blogs.dart'; // Import your Blog model if not already done.

class PostArticle extends StatefulWidget {
  final Function(Blog) onArticlePosted;

  PostArticle({required this.onArticlePosted});
  @override
  _PostArticleState createState() => _PostArticleState();
}

class _PostArticleState extends State<PostArticle> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _articleController = TextEditingController();

  void post_article({required String title, required String desc, required String full_article}) async {
    try {
      http.Response response = await http.post(
        Uri.parse(api), // Replace with your API endpoint.
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'desc': desc,
          'full_article': full_article,
        }),
      );

      if (response.statusCode == 201) {
        // Article successfully posted. You can handle success here.
        Blog newBlog = Blog(
          title: title,
          desc: desc,
          full_article: full_article, publication_date: '', id: null,
        );
        widget.onArticlePosted(newBlog); // Notify the homepage to update.
        _titleController.clear();
        _descriptionController.clear();
        _articleController.clear();
      } else {
        // Handle the failure case.
        throw Exception('Failed to post article.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when they are no longer needed
    _titleController.dispose();
    _descriptionController.dispose();
    _articleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child:
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        // ... (other decoration properties)
                      ),
                      onSubmitted: (value){
                        setState(() {
                          _titleController=value as TextEditingController ;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 60.0,
                    child:
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: "Description",
                        // ... (other decoration properties)
                      ),
                      onSubmitted: (value){
                        setState(() {
                             _descriptionController=value as TextEditingController;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: DynamicTextFieldWithMinHeight(
                      controller: _articleController,
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      post_article(
                        title: _titleController.text,
                        desc: _descriptionController.text,
                        full_article: _articleController.text,
                      );
                    },
                    child: Text('Post'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicTextFieldWithMinHeight extends StatefulWidget {
  final TextEditingController controller;

  DynamicTextFieldWithMinHeight({required this.controller});

  @override
  _DynamicTextFieldWithMinHeightState createState() =>
      _DynamicTextFieldWithMinHeightState();
}

class _DynamicTextFieldWithMinHeightState
    extends State<DynamicTextFieldWithMinHeight> {
  int minLines = 3; // Minimum number of lines
  int maxLines = 100; // Maximum number of lines

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 400.0, // Set the desired minimum height
      ),
      child: TextField(
        controller: widget.controller,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: 'Enter Your Article',
          // ... (other decoration properties)
        ),
        onSubmitted: (value){
          setState(() {

          });
        },
      ),
    );
  }
}
