import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/trending.dart';
import 'package:movieapp/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'widgets/toprated.dart';
import 'widgets/tv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '3297cd80a92ccd0023233fb9609b0168';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMjk3Y2Q4MGE5MmNjZDAwMjMyMzNmYjk2MDliMDE2OCIsInN1YiI6IjYxYTg1NDI0MDcxNjUwMDA0NDJmYmUyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-P4QmNrHIwDNHWHpfCs2Jy5FC0CwdSAEC5ffc_M-TUU';
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(showErrorLogs: true, showLogs: true),
    );
    // var prasad = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();

    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const modified_text(
          text: "Flutter Movie App",
          color: Colors.white,
          size: 19.0,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
          TV(tv: tv),
        ],
      ),
    );
  }
}
