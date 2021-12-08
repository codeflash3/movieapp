import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: '⭐ Average Rating -' + vote,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: modified_text(
               text: name!=null?name:'Not_Loaded',
               color: Colors.white,
               size: 25.0,
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(left:10.0),
            //   child: modified_text(
            //     text: description,
            //     color: Colors.white,
            //     size: 15.0,
            //   ),
            // ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: Container(
                    child:modified_text(
                          text: description,
                          color: Colors.white,
                          size: 15.0,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
