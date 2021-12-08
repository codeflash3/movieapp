import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: "Top-Rated Movies",
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
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: toprated[index]['original_title'] ??
                              (toprated[index]['original_name'] ?? 'Loading'),
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                          description: toprated[index]['overview'],
                          vote: toprated[index]['vote_average'].toString(),
                          launch_on: toprated[index]['release_date'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding:const EdgeInsets.all(5.0),
                    width: 250,


                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          height:140,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                              image: NetworkImage(

                                'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                              ),
                               fit: BoxFit.cover,
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
                              text: toprated[index]['original_title'] ??
                                  (toprated[index]['original_name'] ??
                                      "Loading")),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
