import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy_movie/fetchMovies.dart';
import 'package:housy_movie/movie.dart';
import 'package:intl/intl.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                    top: 100,
                    left: 15,
                    child: Text(
                      'Menu',
                      style: TextStyle(fontSize: 20),
                    )),
                Positioned(
                    top: MediaQuery.of(context).size.height / 3,
                    left: 15,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        showDialog(
                            context:context,
                            builder: (_) {
                              return Dialog(
                             
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(''' Company: Housy
Address: Pune, India
Phone: XXXXXXXXX09
Email: XXXXXX@housy.com''')),
                              );
                            });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.info),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Company Info', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    )),
              ],
            )),
      ),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Icon(Icons.menu)),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: LayoutBuilder(
        builder: (_, size) {
          return Container(
              height: size.maxHeight,
              width: size.maxWidth,
              child: Center(
                child: FutureBuilder(
                  future: fetchMovies(),
                  builder: (_, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      child: ListView.builder(
                          itemCount: (snapshot.data as List<Movie>).length,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            var data = (snapshot.data as List<Movie>);
                            var dateTime = DateTime.fromMicrosecondsSinceEpoch(
                                data[index].releaseDate,
                                isUtc: true);
                            return Card(
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(CupertinoIcons
                                                    .triangle_fill),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 15),
                                                  child: Text(
                                                    data[index]
                                                        .votes
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ),
                                                Transform.rotate(
                                                  angle: -pi,
                                                  child: Icon(CupertinoIcons
                                                      .triangle_fill),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  child:
                                                      Text("Votes".toString()),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 12,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                data[index].poster,
                                                fit: BoxFit.fitWidth,
                                                errorBuilder: (_, __, ___) {
                                                  return Center(
                                                    child: Placeholder(
                                                      fallbackHeight: 100,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 22,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 30, top: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index].movie,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                RichText(
                                                    overflow:
                                                        TextOverflow.visible,
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "Genre:",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      TextSpan(
                                                          text:
                                                              data[index].genre,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black))
                                                    ])),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "Director:",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text:
                                                          data[index].director,
                                                      style: TextStyle(
                                                          color: Colors.black))
                                                ])),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                RichText(
                                                    overflow:
                                                        TextOverflow.visible,
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "Starring:",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      TextSpan(
                                                          text: data[index]
                                                              .starring,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black))
                                                    ])),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "Mins | ${data[index].lang} | ${dateTime.day} ${DateFormat('MMM').format(DateTime(dateTime.year, dateTime.month))}"),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${data[index].views} views | Voted by ${data[index].votes} people",
                                                  style: TextStyle(
                                                      color: Colors.cyan,
                                                      fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        width: size.maxWidth,
                                        margin: EdgeInsets.only(
                                            top: 5,
                                            right: 5,
                                            left: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Center(
                                            child: Text(
                                          "Watch Later",
                                          style: TextStyle(color: Colors.white),
                                        )))
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
