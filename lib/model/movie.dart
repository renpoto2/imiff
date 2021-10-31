import 'package:flutter/cupertino.dart';

class Movie {

 static List<Movie> getMovies()=>[
  Movie("千と千尋の神隠し", "2001", "all", "124m", "https://m.media-amazon.com/images/I/51QNjf+qXWL._AC_.jpg",["https://www.ghibli.jp/images/chihiro.jpg","https://comic-kingdom.jp/wp-content/uploads/2019/09/0922_11-e1569163838926.jpg"]),
  Movie("ハーモニー", "2015", "R-15", "120m", "https://movies-pctr.c.yimg.jp/dk/iwiz-movies/pict/p/p/01/52/166819_03.jpg",["https://www.toho.co.jp/movie/ods/img/harmony_main.jpg","https://eiga.k-img.com/images/movie/80165/gallery/harmony_large.jpg?1428632811"]),
  Movie("虐殺器官", "2017", "R-15", "114m", "http://blog-imgs-102.fc2.com/i/w/a/iwainohondana/170318.jpg",["",""]),
  Movie("僕のヒーローアカデミア", "2021", "all", "104m", "https://eiga.k-img.com/images/buzz/90963/6ec9f87d218008c1/640.jpg?1625730685",["",""]),
  Movie("NARUTO", "2014", "all", "114m", "https://eiga.k-img.com/images/buzz/46621/naruto_large.jpg?1413352148",["",""]),
  Movie("デスノート", "2006", "all", "141m", "https://movies-pctr.c.yimg.jp/dk/iwiz-movies/pict/p/p/2c/5b/145094_01.jpg?w=680",["",""]),
  Movie("サマーウォーズ", "2009", "all", "115m", "https://movies-pctr.c.yimg.jp/dk/iwiz-movies/pict/p/p/52/f8/150847_01.jpg?w=680",["",""]),
  Movie("時をかける少女", "2006", "all", "98m", "https://movies-pctr.c.yimg.jp/dk/iwiz-movies/pict/p/p/3e/cf/145517_04.jpg",["",""])
 ];
 late String title;
late String year;
late String rated;
late String rutime;
late String images;
late List<String> images2;

 Movie(this.title, this.year, this.rated, this.rutime ,this.images, this.images2);
}