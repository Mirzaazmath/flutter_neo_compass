
import 'dart:math';

import 'package:flutter/material.dart';

class  CustomCompass extends CustomPainter{
  final  CardinalityMap={0:"N",90:"E",180:"S",270:"W"};
  late final majorScalePaint=Paint()..style=PaintingStyle.stroke..color=Colors.grey..strokeWidth=2.0;
  late final minorScalePaint=Paint()..style=PaintingStyle.stroke..color=Colors.grey..strokeWidth=1.0;
  late final majorScaleStyle=TextStyle(
      color: Colors.grey,
      fontSize: 8
  );
  late final cardinalStyle=TextStyle(
      color: Colors.red,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  late final _majorTicks=_layoutScale(18);
  late final _minorTicks=_layoutScale(90);
  late final _angledegree=_layoutScale(18);



  @override
  void paint(Canvas canvas, Size size) {
    const  origin= Offset.zero;
    final center= size.center(origin);
    final radius=size.width/2;
    final majorTickLength= size.width*0.08;
    final minarTickLength= size.width*0.05;

    canvas.save();
    // paint majorScale
    for(final angle in _majorTicks){
      final tickStart=Offset.fromDirection((angle-90)*pi/180,radius);
      final tickEnd = Offset.fromDirection((angle-90)*pi/180,100-majorTickLength+40);
      canvas.drawLine(center+tickStart,center+tickEnd,majorScalePaint );

    }

    // paint minorScale
    for(final angle in _minorTicks){
      final tickStart=Offset.fromDirection((angle-90)*pi/180,radius);
      final tickEnd = Offset.fromDirection((angle-90)*pi/180,radius-minarTickLength);
      canvas.drawLine(center+tickStart,center+tickEnd,minorScalePaint );

    }
    // paint angle degree
    for(final angle in _angledegree){
      final textPadding=majorTickLength-size.width*0.01;
      final textPainter=TextSpan(
          text: angle.toStringAsFixed(0),
          style: majorScaleStyle
      ).toPainter()..layout();
      final layoutOffset=Offset.fromDirection((angle-90)*pi/180,radius-textPadding);
      final offset=center+layoutOffset;

      canvas.restore();
      canvas.save();
      canvas.translate(offset.dx,offset. dy);
      canvas.rotate(angle*pi/180);
      canvas.translate(-offset.dx,-offset. dy);

      textPainter.paint(canvas, Offset(offset.dx-(textPainter.width/2),offset. dy));

    }
    // paint  points
    for(final point in CardinalityMap.entries){
      final textPadding=majorTickLength-size.width*0.01;
      final newangel =point.key.toDouble();
      final text= point.value;
      final textPainter=TextSpan(
          text: text,
          style: cardinalStyle
      ).toPainter()..layout();
      final layoutOffset=Offset.fromDirection((newangel-90)*pi/180,radius-textPadding);
      final offset=center+layoutOffset;

      canvas.restore();
      canvas.save();
      canvas.translate(offset.dx,offset. dy);
      canvas.rotate(newangel*pi/180);
      canvas.translate(-offset.dx,-offset. dy-50);

      textPainter.paint(canvas, Offset(offset.dx-(textPainter.width/2),offset. dy));

    }
    canvas.restore();

  }

  List<double>_layoutScale(int ticks){
    final scale = 360/ticks;
    return List.generate(ticks, (index) => index*scale);

  }
  List<double>_layoutAngleScale(List<double>ticks){
    List<double>angle=[];
    for(var i=0;i<ticks.length;i++){
      if(i==ticks.length-1){
        double degreeVal=(ticks[i]*360)/2;
        angle.add(degreeVal);

      }else{
        double degreeVal=(ticks[i]+ticks[i+1])/2;
        angle.add(degreeVal);
      }
    }
    return angle;

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;
// TODO: implement shouldRepaint


}

typedef CardinalityMap=Map<num,String>;
extension on TextSpan{
  TextPainter toPainter({TextDirection textDirection=TextDirection.ltr})=>TextPainter(text: this,textDirection: textDirection);
}

