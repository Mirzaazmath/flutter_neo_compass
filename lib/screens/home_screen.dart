

import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'as neo;
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import '../utils/compasspainter.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final isdarkmode= Theme.of(context).brightness==Brightness.light;

    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor:isdarkmode? const Color(0xff272727): const Color(0xfff3f8ff),
        appBar: AppBar(
          foregroundColor:const   Color(0xff47515c),
          title:const  Text("Compass"),
          leading:const  Icon(Icons.arrow_back_ios,),
          backgroundColor:isdarkmode? const Color(0xff272727): const Color(0xfff3f8ff),
          elevation: 0,
          actions: [
            ThemeSwitcher(
              builder: (context) {
                return IconButton(onPressed: (){

                  ThemeSwitcher.of(context).changeTheme(theme: Theme.of(context).brightness==Brightness.light?ThemeData.dark():ThemeData.light());
                }, icon:const  Icon(Icons.nights_stay_rounded,));
              }
            )
          ],
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 500,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: isdarkmode?const Color(0xff282828):  const  Color(0xfff3f8ff),
              boxShadow: [
                BoxShadow(
                  color:isdarkmode?const  Color(0xff4d4d4d): const Color(0xfffefeff),
                  offset:const  Offset(-4,-4),
                  blurRadius: 5
                ),
                BoxShadow(
                    color:isdarkmode? Colors.black:const  Color(0xffdfecfd),
                    offset:const  Offset(4,4),
                    blurRadius: 5
                ),

              ]
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 280,
                  width:280,
                  decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: isdarkmode?const  Color(0xff282828):  const Color(0xfff3f8ff),
                      boxShadow: [
                        BoxShadow(
                            color:isdarkmode?const  Color(0xff363636): const  Color(0xfffefeff),
                            offset:const  Offset(-20,-20),
                            blurRadius: 25
                        ),
                        BoxShadow(
                            color:isdarkmode? const Color(0xff0c0c0c): const  Color(0xffdfecfd),
                            offset:const  Offset(30,30),
                            blurRadius: 25
                        ),

                      ]
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 180,
                        width:180,
                        decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color:   const Color(0xfff3f8ff),
                            boxShadow: [
                              BoxShadow(
                                  color:isdarkmode?const  Color(0xff272727):  const  Color(0xfffefeff),
                                  offset:const  Offset(-20,-20),
                                  blurRadius: 15
                              ),
                              BoxShadow(
                                  color:isdarkmode?const  Color(0xff282828): const   Color(0xffdfecfd),
                                  offset:const  Offset(20,20),
                                  blurRadius: 15
                              ),
                              //dfecfd
                            ]
                        ),
                      ),
                      Container(
                        height: 180,
                        width:180,
                        decoration: neo.BoxDecoration(
                            shape: BoxShape.circle,
                            color: isdarkmode? const Color(0xff222222): const Color(0xfff3f8ff),
                            boxShadow: [
                             neo. BoxShadow(
                                  color: isdarkmode? Colors.black:const  Color(0xfffefeff),
                                  offset:const  Offset(-10,-10),
                                  blurRadius: 15,
                               inset: true

                              ),
                             neo.BoxShadow(
                                  color: isdarkmode?Colors.black:const  Color(0xffdfecfd),
                                  offset:const  Offset(10,10),
                                  blurRadius: 15,
                                 inset: true
                              ),

                            ]
                        ),
                        alignment: Alignment.center,
                        child:  Container(
                          height: 120,
                          width:120,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: const   Color(0xfffdee9f7),
                              boxShadow: [
                                BoxShadow(
                                    color:isdarkmode?const Color(0xff282828): const Color(0xfffefeff),
                                    offset:const  Offset(-5,-5),
                                    blurRadius: 25
                                ),
                                BoxShadow(
                                    color:isdarkmode?const  Color(0xff282828):const  Color(0xffdfecfd),
                                    offset:const  Offset(5,5),
                                    blurRadius: 25
                                ),

                              ]
                          ),
                          alignment: Alignment.center,
                          child:  CircleAvatar(
                            radius: 53,
                            backgroundColor:isdarkmode?const  Color(0xff47515c):const  Color(0xfff3f9ff),
                            child: Text("260*",style: TextStyle(color: isdarkmode?Colors.white:const  Color(0xff47515c),fontSize: 30,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomPaint(
                  size: Size.square(270),
                  painter: CustomCompass(),

                )

              ],
            ),


          ),
        ),


      ),
    );
  }
}




