import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import "package:intl/intl.dart";

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString;
  List<String> countryDate=List<String>();
  List<String> countryURl=List<String>();
 bool _progressBarActive=true;
 String Europe;
 String kabul;
 String singapore;
 String tokyo;
 String seoul;

   Future<String>  getTime(String url) async{
       http.Response res = await  http.get(url);
       print("resposne: ${res.body}");
       var data=jsonDecode(res.body);
       var date =data['datetime'];
     return date;
}
  Future<String>  getTime1(String url) async{
    http.Response res = await  http.get(url);
    print("resposne: ${res.body}");
    var data1=jsonDecode(res.body);
    var date1 =data1['datetime'];
    return date1;
  }
  Future<String>  getTime2(String url) async{
    http.Response res = await  http.get(url);
    print("resposne: ${res.body}");
    var data2=jsonDecode(res.body);
    var date2 =data2['datetime'];
    return date2;
  }
  Future<String>  getTime3(String url) async{
    http.Response res = await  http.get(url);
    print("resposne: ${res.body}");
    var data3=jsonDecode(res.body);
    var date3 =data3['datetime'];
    return date3;
  }
  Future<String>  getTime4(String url) async{
    http.Response res = await  http.get(url);
    print("resposne: ${res.body}");
    var data4=jsonDecode(res.body);
    var date4 =data4['datetime'];
    return date4;
  }



  @override
  void initState() {
    // TODO: implement initState
    _timeString =
        "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
/*    Europe=_timeString;
    singapore=_timeString;
    tokyo=_timeString;
    seoul=_timeString;
    kabul=_timeString;*/
    countryURl.add('http://worldtimeapi.org/api/timezone/Europe/Rome');
    countryURl.add('http://worldtimeapi.org/api/timezone/Kabul');
    countryURl.add('http://worldtimeapi.org/api/timezone/Asia/Singapore');
    countryURl.add('http://worldtimeapi.org/api/timezone/Asia/Tokyo');
    countryURl.add('http://worldtimeapi.org/api/timezone/Seoul');

    print('${countryURl}');

   // for(int i=0;i>=countryURl.length;i++){
      getTime("http://worldtimeapi.org/api/timezone/Europe/Rome").then((value) {
        setState(() {
          print("Rome $value");
          Europe=value.substring(0, value.indexOf('.'));
          Europe=Europe.replaceAll("T", " ");
        });
      });
      getTime1('http://worldtimeapi.org/api/timezone/Asia/Kabul').then((value)  {
        setState(() {
          print("kabul $value");
kabul=value.substring(0, value.indexOf('.'));
kabul=kabul.replaceAll("T", " ");
        //  countryDate.add(value);
        });

      });
      getTime2('http://worldtimeapi.org/api/timezone/Asia/Singapore').then((value) {
        setState(() {
          print("Singapore $value");
singapore=value.substring(0, value.indexOf('.'));
singapore=singapore.replaceAll("T", " ");

        });

      });
      getTime3('http://worldtimeapi.org/api/timezone/Asia/Tokyo').then((value) {
        setState(() {
          print("Tokyo $value");
tokyo=value.substring(0, value.indexOf('.'));
tokyo=tokyo.replaceAll("T", " ");

        });

      });
      getTime4('http://worldtimeapi.org/api/timezone/America/Santiago').then((value) {
        setState(() {
          print("Seoul $value");
          _progressBarActive=false;
          seoul=value.substring(0, value.indexOf('.'));
          seoul=seoul.replaceAll("T", " ");

        });

      });
   // }

    print('${countryDate}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:Row(
            children: [
              Center(
                child: Text("Clock ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white

                  ),),
              )
            ],
          ),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
              ),
            ), //r
            // here add other icon
            )],
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
        Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_timeString',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '${DateFormat('a').format(DateTime.now())}',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'wed 26 aug',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 6,
                ),
                Image.asset('assets/images/clock.png',width: 15,height: 15,
                  color: Colors.white,),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'mon 8:00 am',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              height: 1,
              color: Colors.white,
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rome',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${getTimeDiffrance(Europe)} behind',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${DateFormat("hh:mm").format(DateTime.parse(Europe==null? _timeString: Europe ))}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${DateFormat('a').format(DateTime.parse(Europe ))}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kabul',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${getTimeDiffrance(kabul)} behind',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                            '${DateFormat("hh:mm").format(DateTime.parse(kabul))}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${DateFormat('a').format(DateTime.parse(kabul))}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Singapore',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${getTimeDiffrance(singapore)} behind',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${DateFormat("hh:mm").format(DateTime.parse(singapore))}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${DateFormat('a').format(DateTime.parse(singapore))}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tokyo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${getTimeDiffrance(tokyo)} behind',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${DateFormat("hh:mm").format(DateTime.parse(tokyo))}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${DateFormat('a').format(DateTime.parse(tokyo))}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Santiago',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${getTimeDiffrance(seoul)} behind',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${DateFormat("hh:mm").format(DateTime.parse(seoul))}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${DateFormat('a').format(DateTime.parse(seoul))}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      _progressBarActive ? Positioned(
             left: MediaQuery.of(context).size.width/2 - 20,
              top: MediaQuery.of(context).size.height/2 - 20,
             child: Center(child: CircularProgressIndicator())) : Container()
          ],
        ),
      ),
    );
  }



  void _getCurrentTime() {
    setState(() {
      _timeString =
          _timeString = "${DateFormat('hh:mm').format(DateTime.now())}";
    });
  }
  String getTimeDiffrance(String endTime){
   DateTime  time=DateTime.parse(endTime);
     return '${DateTime.now().difference(time).inHours}'+" hr";
  }
}
