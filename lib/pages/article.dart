import 'package:blog/widgets/appbar.dart';
import 'package:flutter/material.dart';
class full_articles extends StatefulWidget {
  final int id;
  final String title;
  final String publication_date;
  final String description;
  final String full_article;
  const full_articles({Key? key, required this.id, required this.title, required this.publication_date, required this.description, required this.full_article}) : super(key: key);

  @override
  State<full_articles> createState() => _full_articlesState();
}

class _full_articlesState extends State<full_articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context);},

        ),
        title:Text(widget.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white),),
        backgroundColor: Colors.black54,
      ),

      body:
     SingleChildScrollView(
       child:  Column(
         children: [
           Container(
             padding: EdgeInsets.all(20),
             child: Text(widget.full_article),
           ),
      SizedBox(height: 10,),
      Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up)),
            IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down)),
            IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble)),
            IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
           ],
         ),
      ),
      ],
       )
     ),
    );
  }
}
