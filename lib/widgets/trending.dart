import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: "Trending Movies",
            size: 26,
            color: Colors.white,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: trending[index]['original_title'] ??
                                (trending[index]['original_name'] ?? 'Loading'),
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                            description: trending[index]['overview'],
                            vote: trending[index]['vote_average'].toString(),
                            launch_on: trending[index]['release_date'].toString(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: modified_text(
                                color: Colors.white,
                                size: 14.0,
                                text: trending[index]['original_title'] ??
                                    (trending[index]['original_name'] ??
                                        "Loading")),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
