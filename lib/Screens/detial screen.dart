import 'package:flutter/material.dart';
import 'package:movieapp/Screens/watchlater%20controler.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String year;
  final String rating;
  final String poster_url;
  final String summary_text;
  MovieDetailScreen({super.key,
    required this.title,
    required this.year,
    required this.rating,
    required this.poster_url,
    required this.summary_text,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_sharp),color: Colors.white,),
            Stack(
              children: [
                Image.network(
                  poster_url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.8)
                        ],
                        stops: [0, 1],
                        begin: Alignment(0.5, 0.3),
                        end: Alignment(-0.2, -0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(rating,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 30),
                            Text('Year :$year',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 165,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Feature will be added "),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Watch'),
                          Icon(Icons.play_arrow),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 165,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextButton(
                      onPressed: ()
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Feature will be added "),
                          ),
                        );                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Download'),
                          Icon(Icons.download),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(width: 20,),
                    IconButton(
                      onPressed: () {
                        Provider.of<WatchLaterProvider>(context, listen: false).addToWatchLater({
                          'name': title,
                          'poster_url': poster_url,
                          'year': year,
                          'rating': rating,
                        });
                      },
                      icon: Icon(Icons.add_to_home_screen),iconSize: 22,
                      color: Colors.white,
                    ),
                    const Text(
                      "Add List",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Open trailer");
                      },
                      icon: Icon(Icons.movie_filter),iconSize: 22,
                      color: Colors.white,
                    ),
                    const Text(
                      "Trailer",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Share movie");
                      },
                      icon: Icon(Icons.share),iconSize: 22,
                      color: Colors.white,
                    ),
                    const Text(
                      "Share",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 100,),

                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Report novie");
                      },
                      icon: Icon(Icons.flag_outlined),iconSize: 22,
                      color: Colors.white,
                    ),
                    const Text(
                      "Report",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text("summry".toUpperCase(),style: TextStyle(color: Colors.yellow),),
            Text("$summary_text",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
