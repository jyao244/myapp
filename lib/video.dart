import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:myapp/home_page.dart';
import 'colors.dart' as color;

class Video extends StatefulWidget {
  const Video({ Key key }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _controller;
  bool _play=false;
  List videos=[];

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videos.json").then((value){
      setState(() {
        videos=json.decode(value);
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
        body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst,
              color.AppColor.gradientSecond
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight
          )
        ),
        child: Column(
          children: [
            _play==false? Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size:20,
                          color: color.AppColor.secondPageIconColor
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        size:20,
                        color: color.AppColor.secondPageIconColor
                      )
                    ]
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Begin your study",
                    style: TextStyle(
                      fontSize: 25,
                      color: color.AppColor.homePageContainerTextBig
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.secondPageIconColor
                            ),
                            SizedBox(width: 5),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 16,
                                color: color.AppColor.secondPageIconColor
                              )
                            )
                          ]
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: color.AppColor.secondPageIconColor
                            ),
                            SizedBox(width: 5),
                            Text(
                              "See your study plan",
                              style: TextStyle(
                                fontSize: 16,
                                color: color.AppColor.secondPageIconColor
                              )
                            )
                          ]
                        ),
                      )
                    ]
                  )
                ],
              ),
            ):Container(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(top: 30, left:30, right:30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor)
                      ]
                    )
                  ),
                  _playVideo(context),
                ]
              ),
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70)
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Lesson 1 : Amino acids and proteins",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.circuitsColor
                        )
                      )
                    ]
                  ),
                  SizedBox(height: 20),
                  Expanded(child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: videos.length,
                    itemBuilder: (_, int i){
                    return GestureDetector(
                      onTap: (){
                        _onTapVideo(i);
                        setState(() {
                          if(_play==false){
                            _play=true;
                          }
                        });
                      },
                      child: Container(
                        height: 135,
                        width: 200,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        videos[i]["picture"]
                                      ),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videos[i]["title"],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        videos[i]["time"],
                                        style: TextStyle(
                                          color: Colors.grey[500]
                                        )
                                      )
                                    )
                                  ]
                                )
                              ]
                            )
                          ]
                        ),
                      ),
                    );
                  }))
                ]
              ),
            ))
          ]
        ),
      ),
    );
  }

  _playVideo(BuildContext context){
    if(_controller!=null){
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(_controller)
      );
    }else{
      return Text("Please wait");
    }
  }

  _onTapVideo(int i){
    _controller = VideoPlayerController.asset(videos[i]["video"]);
    setState(() {
      
    });
    _controller..initialize().then((_){
      _controller.play();
        setState(() {
          
        });
    });
  }
}