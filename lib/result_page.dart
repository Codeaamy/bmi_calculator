import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double result;
  const ResultPage({this.result});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  String resultText = 'RESULT';
  Color resultColor = Colors.white;
  String tagLine = "Loading...";
  String imageName = 'normal';


  getBmiChart(){
    if(widget.result < 18){
      // underweight
      updateUI('Underweight', Colors.lightBlue, 'Eat More; Grow Fast', 'underweight');

    }else if(widget.result > 18 && widget.result < 25){
      //Normal
      updateUI('Normal', Colors.greenAccent, 'Stay as it is', 'normal');


    }else if(widget.result > 25 && widget.result < 30){
      //Overweight
      updateUI('Overweight', Colors.yellowAccent, 'Eat Less; Exercise More','overweight');


    }else if(widget.result > 30 && widget.result < 35) {
      //Obese
      updateUI('Obese', Colors.deepOrangeAccent, "Don't Eat; Just Exercise", 'obese');
    }else if(widget.result > 35){
      // Extreme Obese
      updateUI('Extreme Obese', Colors.red, "Exercise Only", 'extreme');
    } else{
      //Error
      resultText = 'Could Not find Result';

    }
  }

  void updateUI(String result_text, Color color, String tag, String image){
    setState(() {
      resultText = result_text;
      resultColor = color;
      tagLine = tag;
      imageName = image;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBmiChart();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColour,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: tabColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                width: width,
                // height: 220,
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(resultText, style: textTextStyle.copyWith(color: resultColor, fontSize: 50),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text("${widget.result.round()}", style: numberTextStyle.copyWith(color: resultColor,fontSize: 70)),
                              // Text("cm", style: textTextStyle,)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(tagLine, style: textTextStyle,),
                      )
                    ],
                  ),
                ),
              ),
            ),
           Image.asset("images/${imageName}.png", height: 350, fit: BoxFit.fitHeight,),
           Spacer(),
            InkWell(
              child: Container(
                width: width,
                height: 70,
                color: Colors.pink,
                child: Center(
                  child: Text('CALCULATE AGAIN', style: textTextStyle,),
                ),

              ),
              onTap: (){
              Navigator.pop(context);
              },
            ),

          ],
        )
    );
  }
}
