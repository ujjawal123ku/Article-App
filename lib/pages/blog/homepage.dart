import 'package:blog/models/blogs.dart';
import 'package:blog/pages/blog/post_Article.dart';
import 'package:blog/widgets/appbar.dart';
import 'package:blog/widgets/blockcontainer.dart';
import 'package:blog/widgets/drawer.dart';
import 'package:blog/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:blog/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}
 class _homepageState extends State<homepage> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   String searchQuery = '';
  bool isLoading = false;
  List<Blog> myBlogs = [];

  void fetchdata() async {
    try {
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);

      List<Blog> blogs = [];

      for (var blogData in data) {
        Blog blog = Blog.fromJson(blogData);
        blogs.add(blog);
      }

      setState(() {
        myBlogs = blogs;
      });

      print("Data fetched successfully. Number of blogs: ${myBlogs.length}");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

   void updateBlogsList(Blog newBlog) {
     setState(() {
       myBlogs.add(newBlog);
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
          children: [
            Positioned(
              child:
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Search bar with Padding
                  Container(
                    padding: EdgeInsets.only(top: 40,left: 10,right: 20),

                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: IconButton(
                            icon: Icon(Icons.person), onPressed: () {   _scaffoldKey.currentState?.openDrawer(); },



                        ),
                        ),


                        Container(

                          height: 35,
                          width: 250,
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.grey, width: 2),
                            color: Colors.white,
                          ),
                          child: TextField(

                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            decoration: InputDecoration(

                              hintText: 'Search...',
                            ),
                          ),
                        ),
                        InkWell(child: Icon(Icons.settings),),

                      ],
                    ),
                  ),

                  // Add separation between search bar and other content
                  SizedBox(height: 20),

                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      :
                  Column(
                    // Ensure ListView takes the necessary space
                    children: myBlogs.map((e) {
                      return BlogContainer(
                        id: e.id??0,
                        title: e.title,
                        publication_date: e.publication_date,
                        description: e.desc,
                        full_article: e.full_article,
                      );
                    }).toList(),
                  ),

                ],
              ),
            ),
            ),
            Positioned(
              top: 650,
                left: 320,
                child:
                  ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Background color
                      onPrimary: Colors.white, // Text color
                      elevation: 5, // Elevation (shadow)
                      padding: EdgeInsets.all(16), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Button shape
                      ),
                    ),



                  onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return PostArticle(onArticlePosted: updateBlogsList);
                      }));

                  },
                  child: Text('+',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                )
            )
          ],

      ),
      drawer: appDrawer(context),
    );
  }

}
