import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;

class Interests extends StatefulWidget {
  @override
  _InterestsState createState() => new _InterestsState();
}

class _InterestsState extends State<Interests> {

  bool artUpdate_1 = false;
  bool foodUpdate_1 = false;
  bool outdoorsUpdate_1 = false;
  bool sportsUpdate_1 = false;
  bool hobbiesUpdate_1 = false;

  bool artUpdate_2 = false;
  bool foodUpdate_2 = false;
  bool outdoorsUpdate_2 = false;
  bool sportsUpdate_2 = false;
  bool hobbiesUpdate_2 = false;


  bool artUpdate_3 = false;
  bool foodUpdate_3 = false;
  bool outdoorsUpdate_3 = false;
  bool sportsUpdate_3 = false;
  bool hobbiesUpdate_3 = false;

  bool artUpdate_4 = false;
  bool foodUpdate_4 = false;
  bool outdoorsUpdate_4 = false;
  bool sportsUpdate_4 = false;
  bool hobbiesUpdate_4 = false;

  bool artUpdate_5 = false;
  bool foodUpdate_5 = false;
  bool outdoorsUpdate_5 = false;
  bool sportsUpdate_5 = false;
  bool hobbiesUpdate_5 = false;

  String firstChoice = "";
  String secondChoice = "";
  String thirdChoice = "";
  String fourthChoice = "";
  String fifthChoice = "";

  int cat1 = -1;
  int cat2 = -1;
  int cat3 = -1;
  int cat4 = -1;
  int cat5 = -1;

  // helper method that makes a get request to add interest preferences
  inputData() async {
    var httpClient = createHttpClient();
    var response = await httpClient.get(
        'http://localhost:8080/tiger-connect/interest?id=${globals.user_id}&c1=${cat1}&c2=${cat2}&c3=${cat3}&c4=${cat4}&c5=${cat5}&s1=${firstChoice}&s2=${secondChoice}&s3=${thirdChoice}&s4=${fourthChoice}&s5=${fifthChoice}');
    print(response.statusCode);
    print(response.body);
    Navigator.of(context).pushNamed("/HomeProfilePage");
  }

  @override
  Widget build(BuildContext context) {

    // the onPressed button that wil route to home screen
    var raisedButton = new Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 80.0, left: 80.0, bottom: 80.0),

        child: new RaisedButton(
          child: new Text("Next",
            style: new TextStyle(
                color: Colors.orangeAccent,
                fontSize: 18.0),
          ),
          color: Colors.black,
          onPressed: () {
            inputData();
          },
        )
    );

    return new Container(

        child: new ListView(

            padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 30.0),
            children: <Widget>[

              new Text("1. Choose your top interest!",
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[

                  new Column(
                    children: <Widget>[
                      new Text("Food",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: foodUpdate_1,
                        onChanged: (bool food) {
                          setState(() {
                            if (artUpdate_1 || outdoorsUpdate_1 || sportsUpdate_1 ||
                                hobbiesUpdate_1 == true) {
                              foodUpdate_1 = false;
                            }
                            else {
                              cat1 = 3;
                              foodUpdate_1 = food;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Arts",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: artUpdate_1,
                        onChanged: (bool art) {
                          setState(() {
                            if (foodUpdate_1 || outdoorsUpdate_1 || sportsUpdate_1 ||
                                hobbiesUpdate_1 == true) {
                              artUpdate_1 = false;
                            }
                            else {
                              cat1 = 1;
                              artUpdate_1 = art;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Outdoors",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: outdoorsUpdate_1,
                        onChanged: (bool outdoors) {
                          setState(() {
                            if (foodUpdate_1 || artUpdate_1 || sportsUpdate_1 ||
                                hobbiesUpdate_1 == true) {
                              outdoorsUpdate_1 = false;
                            }

                            else {
                              cat1 = 4;
                              outdoorsUpdate_1 = outdoors;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Sports" + "\n" + " and" + "\n" + "Fitness",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: sportsUpdate_1,
                        onChanged: (bool sports) {
                          setState(() {
                            if (foodUpdate_1 || outdoorsUpdate_1 || artUpdate_1 ||
                                hobbiesUpdate_1 == true) {
                              sportsUpdate_1 = false;
                            }
                            else {
                              cat1 = 2;
                              sportsUpdate_1 = sports;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Hobbies",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: hobbiesUpdate_1,
                        onChanged: (bool hobbies) {
                          setState(() {
                            if (foodUpdate_1 || outdoorsUpdate_1 || sportsUpdate_1 ||
                                artUpdate_1 == true) {
                              hobbiesUpdate_1 = false;
                            }
                            else {
                              cat1 = 5;
                              hobbiesUpdate_1 = hobbies;
                            }
                          });
                        },
                      )
                    ],
                  ),

                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(right: 78.0, left: 78.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Optional: Specify your choice",
                  ),
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black
                  ),
                  onChanged: (String interest) {
                    setState(() {
                      firstChoice = interest;
                    });
                  },
                ),
              ),

              new Text("2. Choose your second interest!",
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[

                  new Column(
                    children: <Widget>[
                      new Text("Food",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: foodUpdate_2,
                        onChanged: (bool food) {
                          setState(() {
                            if (artUpdate_2 || outdoorsUpdate_2 || sportsUpdate_2 ||
                                hobbiesUpdate_2 == true) {
                              foodUpdate_2 = false;
                            }
                            else {
                              cat2 = 3;
                              foodUpdate_2 = food;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Arts",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: artUpdate_2,
                        onChanged: (bool art) {
                          setState(() {
                            if (foodUpdate_2 || outdoorsUpdate_2 || sportsUpdate_2 ||
                                hobbiesUpdate_2 == true) {
                              artUpdate_2 = false;
                            }
                            else {
                              cat2 = 1;
                              artUpdate_2 = art;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Outdoors",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: outdoorsUpdate_2,
                        onChanged: (bool outdoors) {
                          setState(() {
                            if (foodUpdate_2 || artUpdate_2 || sportsUpdate_2 ||
                                hobbiesUpdate_2 == true) {
                              outdoorsUpdate_2 = false;
                            }

                            else {
                              cat2 = 4;
                              outdoorsUpdate_2 = outdoors;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Sports" + "\n" + " and" + "\n" + "Fitness",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: sportsUpdate_2,
                        onChanged: (bool sports) {
                          setState(() {
                            if (foodUpdate_2 || outdoorsUpdate_2 || artUpdate_2 ||
                                hobbiesUpdate_2 == true) {
                              sportsUpdate_2 = false;
                            }
                            else {
                              cat2 = 2;
                              sportsUpdate_2 = sports;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Hobbies",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: hobbiesUpdate_2,
                        onChanged: (bool hobbies) {
                          setState(() {
                            if (foodUpdate_2 || outdoorsUpdate_2 || sportsUpdate_2 ||
                                artUpdate_2 == true) {
                              hobbiesUpdate_2 = false;
                            }
                            else {
                              cat2 = 5;
                              hobbiesUpdate_2 = hobbies;
                            }
                          });
                        },
                      )
                    ],
                  ),

                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(right: 78.0, left: 78.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Optional: Specify your choice",
                  ),
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black
                  ),
                  onChanged: (String interest) {
                    setState(() {
                      secondChoice = interest;
                    });
                  },
                ),
              ),

              new Text("3. Choose your third interest!",
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[

                  new Column(
                    children: <Widget>[
                      new Text("Food",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: foodUpdate_3,
                        onChanged: (bool food) {
                          setState(() {
                            if (artUpdate_3 || outdoorsUpdate_3 || sportsUpdate_3 ||
                                hobbiesUpdate_3 == true) {
                              foodUpdate_3 = false;
                            }
                            else {
                              cat3 = 3;
                              foodUpdate_3 = food;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Arts",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: artUpdate_3,
                        onChanged: (bool art) {
                          setState(() {
                            if (foodUpdate_3 || outdoorsUpdate_3 || sportsUpdate_3 ||
                                hobbiesUpdate_3 == true) {
                              artUpdate_3 = false;
                            }
                            else {
                              cat3 = 1;
                              artUpdate_3 = art;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Outdoors",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: outdoorsUpdate_3,
                        onChanged: (bool outdoors) {
                          setState(() {
                            if (foodUpdate_3 || artUpdate_3 || sportsUpdate_3 ||
                                hobbiesUpdate_3 == true) {
                              outdoorsUpdate_3 = false;
                            }

                            else {
                              cat3 = 4;
                              outdoorsUpdate_3 = outdoors;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Sports" + "\n" + " and" + "\n" + "Fitness",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: sportsUpdate_3,
                        onChanged: (bool sports) {
                          setState(() {
                            if (foodUpdate_3 || outdoorsUpdate_3 || artUpdate_3 ||
                                hobbiesUpdate_3 == true) {
                              sportsUpdate_3 = false;
                            }
                            else {
                              cat3 = 2;
                              sportsUpdate_3 = sports;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Hobbies",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: hobbiesUpdate_3,
                        onChanged: (bool hobbies) {
                          setState(() {
                            if (foodUpdate_3 || outdoorsUpdate_3 || sportsUpdate_3 ||
                                artUpdate_3 == true) {
                              hobbiesUpdate_3 = false;
                            }
                            else {
                              cat3 = 5;
                              hobbiesUpdate_3 = hobbies;
                            }
                          });
                        },
                      )
                    ],
                  ),

                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(right: 78.0, left: 78.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Optional: Specify your choice",
                  ),
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black
                  ),
                  onChanged: (String interest) {
                    setState(() {
                      thirdChoice = interest;
                    });
                  },
                ),
              ),

              new Text("4. Choose your fourth interest!",
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[

                  new Column(
                    children: <Widget>[
                      new Text("Food",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: foodUpdate_4,
                        onChanged: (bool food) {
                          setState(() {
                            if (artUpdate_4 || outdoorsUpdate_4 || sportsUpdate_4 ||
                                hobbiesUpdate_4 == true) {
                              foodUpdate_4 = false;
                            }
                            else {
                              cat4 = 3;
                              foodUpdate_4 = food;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Arts",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: artUpdate_4,
                        onChanged: (bool art) {
                          setState(() {
                            if (foodUpdate_4 || outdoorsUpdate_4 || sportsUpdate_4 ||
                                hobbiesUpdate_4 == true) {
                              artUpdate_4 = false;
                            }
                            else {
                              cat4 = 1;
                              artUpdate_4 = art;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Outdoors",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: outdoorsUpdate_4,
                        onChanged: (bool outdoors) {
                          setState(() {
                            if (foodUpdate_4 || artUpdate_4 || sportsUpdate_4 ||
                                hobbiesUpdate_4 == true) {
                              outdoorsUpdate_4 = false;
                            }

                            else {
                              cat4 = 4;
                              outdoorsUpdate_4 = outdoors;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Sports" + "\n" + " and" + "\n" + "Fitness",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: sportsUpdate_4,
                        onChanged: (bool sports) {
                          setState(() {
                            if (foodUpdate_4 || outdoorsUpdate_4 || artUpdate_4 ||
                                hobbiesUpdate_4 == true) {
                              sportsUpdate_4 = false;
                            }
                            else {
                              cat4 = 2;
                              sportsUpdate_4 = sports;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Hobbies",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: hobbiesUpdate_4,
                        onChanged: (bool hobbies) {
                          setState(() {
                            if (foodUpdate_4 || outdoorsUpdate_4 || sportsUpdate_4 ||
                                artUpdate_4 == true) {
                              hobbiesUpdate_4 = false;
                            }
                            else {
                              cat4 = 5;
                              hobbiesUpdate_4 = hobbies;
                            }
                          });
                        },
                      )
                    ],
                  ),

                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(right: 78.0, left: 78.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Optional: Specify your choice",
                  ),
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black
                  ),
                  onChanged: (String interest) {
                    setState(() {
                      fourthChoice = interest;
                    });
                  },
                ),
              ),

              new Text("5. Choose your fifth interest!",
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[

                  new Column(
                    children: <Widget>[
                      new Text("Food",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: foodUpdate_5,
                        onChanged: (bool food) {
                          setState(() {
                            if (artUpdate_5 || outdoorsUpdate_5 || sportsUpdate_5 ||
                                hobbiesUpdate_5 == true) {
                              foodUpdate_5 = false;
                            }
                            else {
                              cat5 = 3;
                              foodUpdate_5 = food;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Arts",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: artUpdate_5,
                        onChanged: (bool art) {
                          setState(() {
                            if (foodUpdate_5 || outdoorsUpdate_5 || sportsUpdate_5 ||
                                hobbiesUpdate_5 == true) {
                              artUpdate_5 = false;
                            }
                            else {
                              cat5 = 1;
                              artUpdate_5 = art;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Outdoors",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: outdoorsUpdate_5,
                        onChanged: (bool outdoors) {
                          setState(() {
                            if (foodUpdate_5 || artUpdate_5 || sportsUpdate_5 ||
                                hobbiesUpdate_5 == true) {
                              outdoorsUpdate_5 = false;
                            }

                            else {
                              cat5 = 4;
                              outdoorsUpdate_5 = outdoors;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Sports" + "\n" + " and" + "\n" + "Fitness",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: sportsUpdate_5,
                        onChanged: (bool sports) {
                          setState(() {
                            if (foodUpdate_5 || outdoorsUpdate_5 || artUpdate_5 ||
                                hobbiesUpdate_5 == true) {
                              sportsUpdate_5 = false;
                            }
                            else {
                              cat5 = 2;
                              sportsUpdate_5 = sports;
                            }
                          });
                        },
                      )
                    ],
                  ),

                  new Column(
                    children: <Widget>[
                      new Text("Hobbies",
                        style: new TextStyle(
                            fontSize: 12.0
                        ),
                      ),
                      new Checkbox(
                        activeColor: Colors.deepPurple,
                        value: hobbiesUpdate_5,
                        onChanged: (bool hobbies) {
                          setState(() {
                            if (foodUpdate_5 || outdoorsUpdate_5 || sportsUpdate_5 ||
                                artUpdate_5 == true) {
                              hobbiesUpdate_5 = false;
                            }
                            else {
                              cat5 = 5;
                              hobbiesUpdate_5 = hobbies;
                            }
                          });
                        },
                      )
                    ],
                  ),

                ],
              ),

              new Padding(
                padding: const EdgeInsets.only(right: 78.0, left: 78.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Optional: Specify your choice",
                  ),
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black
                  ),
                  onChanged: (String interest) {
                    setState(() {
                      fifthChoice = interest;
                    });
                  },
                ),
              ),
              raisedButton,

            ]
        )
    );
  }
}
