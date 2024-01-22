import 'dart:convert';
import 'dart:html';
import 'package:demo_ss1/entity/comment_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  @override
  Future<List<Comment>> fetchData () async {
    String url = "https://jsonplaceholder.typicode.com/comments?_limit=10&&_page=1";
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body) as List;
        return data.map((e) => Comment.valueFromJson(e)).toList();
      }
    }catch(e){
      print(e);
    }
    return [];
  }
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("FutureBuilder"),
                backgroundColor: Colors.blue.withOpacity(0.6),
          ),
          body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return Text("Not data");
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator(),);
                case ConnectionState.done:
                  if(snapshot.hasError){
                    return Text("error get data");
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                      itemBuilder: (context,index){
                        Comment comment = snapshot.data![index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width:double.infinity,
                        height: 300,
                        color: Colors.green.withOpacity(0.4),
                        child: Column(
                         children: [
                        Text("${comment.postId}"),
                        Text("${comment.id}"),
                        Text("${comment.name}"),
                        Text("${comment.email}"),
                        Text("${comment.body}"),
                        ],
                        ),
                        );
                    }
                  );
              }
            },
        ),
        ),
      ),
    );
  }
}
