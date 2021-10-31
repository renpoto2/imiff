// import 'dart:ffi';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:imifffff/model/movie.dart';
import 'package:imifffff/model/qustion.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int index = 0;
  List quats = ["a", "b", "c", "f"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent.shade400,
                  borderRadius: BorderRadius.circular(23.0),
                ),
                child: Center(
                    child: Text(
                  quats[index % quats.length],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 66,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ))),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FlatButton.icon(
                onPressed: _showQuate,
                color: Colors.lightBlueAccent,
                icon: Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                label: Text("PP"),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _showQuate() {
    setState(() {
      index += 1;
    });
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSP createState() => _BillSP();
}

class _BillSP extends State<BillSplitter> {
  int _tipPercent = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(30),
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(11.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Per Person.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      "\$ 3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border:
                    Border.all(color: Colors.black38, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixText: "pp",
                      prefixIcon: Icon(Icons.money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("OK", style: TextStyle(color: Colors.black)),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {}
                                ;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 50,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.black),
                              child: Center(
                                child: Text("-",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 50,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.black),
                              child: Center(
                                child: Text("+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$ ${clucurateTotalTip(_billAmount, _personCounter, _tipPercent)}",
                          style: TextStyle(color: Colors.black38, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercent",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 5,
                          activeColor: Colors.lightBlue,
                          inactiveColor: Colors.black12,
                          value: _tipPercent.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercent = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  caluculateTotalPercentage(double billAmount, int splitBy, int tipPecentage) {
    var totalPerPerson =
        (clucurateTotalTip(billAmount, splitBy, tipPecentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  clucurateTotalTip(double billAmount, int splitBy, int tipPecentage) {
    double totaltip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      debugPrint("OMG");
    } else {
      totaltip = (billAmount * tipPecentage) / 100;
    }
  }
}

class QiuzApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QiuzApp> {
  int _currenQIndex = 0;
  List questionbank = [
    QuestionA.name("omg", true),
    QuestionA.name("筍食べたい", false),
    QuestionA.name("カニ食べたい", true),
    QuestionA.name("熊肉食べたい", false),
    QuestionA.name("鹿肉", true),
    QuestionA.name("ジビエもあり", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The citizen"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(builder: (context) {
        return Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "image/flag.png",
                width: 150,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.5),
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    )),
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      questionbank[_currenQIndex].questionText2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    child: RaisedButton(
                      onPressed: () => _backQ(),
                      color: Colors.amberAccent,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => _checkAncer(true, context),
                  color: Colors.amberAccent,
                  child: Text(
                    "TRUE",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                RaisedButton(
                  onPressed: () => _checkAncer(false, context),
                  color: Colors.amberAccent,
                  child: Text(
                    "FALSE",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: RaisedButton(
                    onPressed: () => _nextQ(),
                    color: Colors.amberAccent,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ));
      }),
    );
  }

  _checkAncer(bool userChoice, BuildContext context) {
    if (userChoice == questionbank[_currenQIndex].isCorrect) {
      debugPrint("OK");

      final snackbar = SnackBar(
          backgroundColor: Colors.amberAccent,
          duration: Duration(microseconds: 3000),
          content: Text(
            "Good!",
            style: TextStyle(
              color: Colors.black,
            ),
          ));
      Scaffold.of(context).showSnackBar(snackbar);
      setState(() {
        _currenQIndex++;
      });
      _updateQ();
    } else {
      debugPrint("nope");
      final snackbar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(microseconds: 3000),
          content: Text("Nope!"));
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQ();
    }
  }

  _updateQ() {
    setState(() {
      _currenQIndex = (_currenQIndex + 1) % questionbank.length;
    });
  }

  _nextQ() {
    _updateQ();
  }

  _backQ() {
    setState(() {
      _currenQIndex = (_currenQIndex - 1) % questionbank.length;
    });
  }
}

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "千と千尋の神隠し",
    "ハーモニー",
    "虐殺器官",
    "僕のヒーローアカデミア",
    "NARUTO",
    "デスノート",
    "サマーウォーズ",
    "時をかける少女",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Positioned(child: movieCard(movieList[index], context)),
              Positioned(
                top: 10,
                child: movieImages(movieList[index].images),
              ),

            ]);
            // return Card(
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 500,
            //         height: 500,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: NetworkImage(movieList[index].images),
            //               fit: BoxFit.cover
            //             ),
            //
            //             borderRadius: BorderRadius.circular(20.0)),
            //
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text(movieList[index].rutime),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetails(
            //                   movieName: movieList.elementAt(index).title,
            //                   movie: movieList[index])));
            //     },
            //
            //     // onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 100),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Flexible(
                        child: Text(movie.title,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),),
                      ), Text("年齢制限　${movie.rated}")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Released at ${movie.year}"),
                        Text(movie.rutime),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieListViewDetails(
                          movieName: movie.title, movie: movie))),
            });
  }

  Widget movieImages(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetails(
      {Key? key, required this.movieName, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.grey,
      ),
      body:ListView(
        children: [
MovieDetails2(thumbnail: movie.images),
          MoviDetailsHeaderWP(movie:movie ),
          HorizontalLine(),
          MovieExtraPoster(posters: movie.images2),
        ],
      ) ,
      // body: Center(
      //   child: Container(
      //       child: RaisedButton(
      //     child: Text("Go back -Movie List-"),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   )),
      // ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('movieName', movieName));
  }
}
class MovieDetails2 extends StatelessWidget{
final String thumbnail;

  const MovieDetails2({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Stack(
     alignment: Alignment.bottomCenter,

     children: [
       Stack(
         alignment: Alignment.center,
           children: [
             Container(
               width: MediaQuery.of(context).size.width,
               height: 200,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage(thumbnail),
                   fit: BoxFit.cover
                 )
               ),
             ),
             Icon(Icons.play_circle_outline,size: 100,color: Colors.white,)
           ],
       ),
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [Color(0x000f5f4),Color(0x0000f4f5)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )
  ),
  height: 80,
),
     ],
   );
  }
}
class MoviDetailsHeaderWP extends StatelessWidget{
  final Movie movie;

  const MoviDetailsHeaderWP({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
padding: const EdgeInsets.symmetric(horizontal: 8),
     child: Row(
       children: [
         MoviePoster(poster: movie.images2[0]),
         SizedBox(width: 10,),
         Expanded(
           child: MovieDetailH(movie:movie),
         ),

       ],
     ),
   );
  }
}

class MovieDetailH extends StatelessWidget{
  final Movie movie;

  const MovieDetailH({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [Text("${movie.year}",style: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  ),),
    Text(movie.title,style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900
    ),),
Text.rich(TextSpan(style:TextStyle(
  fontSize: 12,
),
children: <TextSpan>[
TextSpan(text: movie.rutime)
]),),
  ],
);
  }
}

class MoviePoster extends StatelessWidget{
final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {

return const Card(
  child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    child: SizedBox(
      width: 150,
      height: 150,
    ),
  ),

);

  }
}
class HorizontalLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
     child: Container(
       height: 0.5,
       color: Colors.grey,
     ),
   );
  }
}
class MovieExtraPoster extends StatelessWidget{
  final List<String> posters;

  const MovieExtraPoster({Key? key, required this.posters}) : super(key: key);
@override
  Widget build(BuildContext context) {
   return Column(
crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text("More Movie Images".toUpperCase(),
       style: TextStyle(
         fontSize: 8.0,
       ),),
       Container(
         height: 200,
         child:
         ListView.separated(
           scrollDirection: Axis.horizontal,
             itemBuilder: (context,index)=> ClipRRect(
borderRadius: BorderRadius.all(Radius.circular(8)),
           child: Container(
             width: MediaQuery.of(context).size.width/4,
             height: 160,
             decoration: BoxDecoration(
               image: DecorationImage(image: NetworkImage(posters[index]),
                 fit: BoxFit.cover

               ),
             ),
           ),
             ),
             separatorBuilder:(context,index)=> SizedBox(width: 8.0,),

             itemCount: posters.length),

       ),
     ],
   );
  }
}