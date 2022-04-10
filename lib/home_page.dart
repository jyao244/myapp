import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/video.dart';
// import 'package:get/get.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List subjects=[];

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/subjects.json").then((value){
      setState(() {
        subjects=json.decode(value);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "khan Academy",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons),
                SizedBox(width:10),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons),
                SizedBox(width:15),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons)
              ]
            ),
            SizedBox(height:30),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Video()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons
                  ),
                )
              ]
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst,
                    color.AppColor.gradientSecond
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80)
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5,10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond.withOpacity(0.2)
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left:20, top:25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Begin your study",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextBig
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Time is money, no time to lose",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextBig
                      ),
                    ),
                    SizedBox(height: 45),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.timer, size:20, color: color.AppColor.homePageContainerTextSmall),
                        SizedBox(width: 10),
                        Text(
                          "60 min",
                          style: TextStyle(
                            fontSize: 14,
                            color: color.AppColor.homePageContainerTextBig
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4,8)
                              )
                            ]
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60
                          ),
                        )
                      ]
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Subjects",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle
                  )
                )
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: (subjects.length.toDouble()/2).toInt(),
                itemBuilder: (_, i){
                  int a = 2*i;
                  int b = 2*i+1;
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.1,
                          bottom: 30),
                        padding: EdgeInsets.only(bottom: 5),
                        height: 200,
                        width: MediaQuery.of(context).size.width*0.375,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                              subjects[a]['img']
                            )
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(5,5),
                              color: color.AppColor.gradientSecond.withOpacity(0.1)
                            ),
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(-5,-5),
                              color: color.AppColor.gradientSecond.withOpacity(0.1)
                            )
                          ]
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              subjects[a]['title'],
                              style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageDetail
                              )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.05,
                          right: MediaQuery.of(context).size.width*0.1,
                          bottom: 30),
                        padding: EdgeInsets.only(bottom: 5),
                        height: 200,
                        width: MediaQuery.of(context).size.width*0.375,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                              subjects[b]['img']
                            )
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(5,5),
                              color: color.AppColor.gradientSecond.withOpacity(0.1)
                            ),
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(-5,-5),
                              color: color.AppColor.gradientSecond.withOpacity(0.1)
                            )
                          ]
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              subjects[b]['title'],
                              style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageDetail
                              )
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
            )
            )
        ],)
      )
    );
  }
}