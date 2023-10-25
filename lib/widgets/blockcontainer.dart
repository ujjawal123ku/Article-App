import 'package:blog/pages/article.dart';
import 'package:flutter/material.dart';
class BlogContainer extends StatefulWidget {
  final int id;
  final String title;
  final String publication_date;
  final String description;
  final String full_article;

   const BlogContainer({
    Key?key,
     required this.id,
     required this.title,
     required this.publication_date,
     required this.description,
     required this.full_article

}):super(key: key);

  @override
  State<BlogContainer> createState() => _BlogContainerState();
}

class _BlogContainerState extends State<BlogContainer> {


  @override
  Widget build(BuildContext context) {
    return Padding(


        padding:EdgeInsets.only(top: 0,left: 10,right: 20),
      child:
      Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text("User name"),
                    SizedBox(width: 5,),
                    Text('Follow+',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),),
                  ],

                ),
              ),
              InkWell(
                onTap: (){},
                  child: Icon(Icons.bookmark)),

            ],

          ),
          SizedBox(height: 5,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => full_articles( id: widget.id,
                title: widget.title,
                publication_date: widget.publication_date,
                description: widget.description,
                full_article: widget.full_article,)));

            },
                child: Container(
                  width: 320,


                  padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.black54,
                        width: 0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(

                    children: [
                      Text(widget.title,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 20,),
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(widget.publication_date,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.blue,),),
                          SizedBox(height: 5,),
                          Text(widget.description,style: TextStyle(fontSize: 10),),


                        ],
                      ),
                    ],
                  ),

                ),
              ),
          Container( width: 320,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up)),
                IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down)),
                IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble)),
                IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),


              ],
            ),
          )
        ],
      ),



    );
  }
}
