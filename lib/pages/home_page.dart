// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:githubproject/models/repo_model.dart';
import 'package:http/http.dart' as http;

import '../models/commit_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ReposModel> postlist = [];
  List<Commit> commitlist = [];

  Future<List<ReposModel>> getPostApi() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/freeCodeCamp/repos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(jsonDecode(response.body));
      for (Map i in data) {
        postlist.add(ReposModel.fromJson(i));
      }

      // await getCommitApi();
      return postlist;
    } else {
      throw Exception('Failed to load Repos');
    }
    ;
  }

  // Future<List<Commit>?> getCommitApi() async {
  //   for(final repo in postlist){
  //     final response = await http
  //         .get(Uri.parse('https://api.github.com/users/freeCodeCamp/${repo.name}/commits'));
  //     var data = jsonDecode(response.body.toString());

  //     if (response.statusCode == 200) {
  //       // If the server did return a 200 OK response,
  //       // then parse the JSON.
  //       // print(jsonDecode(response.body));
  //       for (Map i in data) {
  //         commitlist.add(Commit.fromJson(i));
  //       }
  //       return commitlist;
  //     } else {
  //       throw Exception('Failed to load Repos');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreeCodeCamp Pu'),
      ),
      body: FutureBuilder(
          future: getPostApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Wait');
            } else {
              return ListView.builder(
                  itemCount: postlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black38,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "Name : " + postlist[index].name.toString(),
                                style: TextStyle(
                                    color: Colors.lightBlue[800],
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Repository Name : ${postlist[index].fullname}'),
                              Text('Commit  : ${commitlist}'),
                            ],
                          ),
                        ));
                  });
            }
          }),
    );
  }
}
