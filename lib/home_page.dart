import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


enum Gender{
  male,
  female,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightNumber = 160.0;

  Color activeColor = tabColour;
  Color inactiveColor = backgroundColour;
  Color maleTabColour = backgroundColour;
  Color femaleTabColour = tabColour;

  Color selectedColour = Colors.white;
  Color notSelectedColour = Colors.grey;
  Color maleTextColor =  Colors.grey;
  Color femaleTextColour = Colors.white;

  int weight = 60;
  int age = 25;

  updateUI(Gender gender){
    //if GenderNumber == 1 its Male else it is female
    if(gender == Gender.male){
      //Male Block Of Code
      setState(() {
        maleTabColour = activeColor;
        femaleTabColour = inactiveColor;
        maleTextColor = selectedColour;
        femaleTextColour = notSelectedColour;
      });
    }else{

      //Female Block Of Code
      setState(() {
        femaleTabColour = activeColor;
        maleTabColour = inactiveColor;
        maleTextColor = notSelectedColour;
        femaleTextColour = selectedColour;
      });
    }
  }

  addSubtractAge(bool add){
    add ? age++ : age--;
  }

  addSubtractWeight(bool weightAdd){
    weightAdd ? weight++ : weight--;
  }

  @override
  Widget  build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColour,
        title: Text("BMI CALCULATOR")
      ),
      backgroundColor: backgroundColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

            // color: tabColour,
            width: width,
            height: 162,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0,top: 8.0 ),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: maleTabColour,
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      width: width / 2 - 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.mars, color: maleTextColor,size: 70,),
                          Text("MALE", style: textTextStyle.copyWith(color: maleTextColor))
                        ],
                      ),
                    ),
                    onTap: (){
                      print("Tapped male button");
                      updateUI(Gender.male);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:4.0, top: 8, right: 8.0),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: femaleTabColour,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: width / 2 - 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.venus, color: femaleTextColour,size: 70,),
                          Text("FEMALE", style: textTextStyle.copyWith(color: femaleTextColour),)
                        ],
                      ),
                    ),
                    onTap: (){
                      print("Femlae button tapped");
                      updateUI(Gender.female);
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: tabColour,
                borderRadius: BorderRadius.circular(5.0),
              ),
              width: width,
              height: 220,
              child: Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("HEIGHT", style: textTextStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text("${heightNumber.round()}", style: numberTextStyle,),
                            Text("cm", style: textTextStyle,)
                          ],
                        ),

                      ),
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Colors.pink.withOpacity(0.2),
                      ),

                      child: Slider(
                        value: heightNumber,
                        max: 200,
                        min: 120,
                        onChanged: (value){
                          setState(() {
                            heightNumber = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 190,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0,top: 8.0 ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: tabColour,
                      borderRadius: BorderRadius.circular(5.0),

                    ),
                    width: width / 2 - 12,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("WEIGHT", style: textTextStyle,),
                        ),
                        Text("${weight}", style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(Icons.remove, color: Colors.white,),
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                  addSubtractWeight(false);

                                });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.1)
                                  ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(Icons.add, color: Colors.white,),
                                    )
                                ),
                                onTap: (){
                                setState(() {
                                  addSubtractWeight(true);
                                });
                                },
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:4.0, top: 8, right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: tabColour,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    width: width / 2 - 12,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("AGE", style: textTextStyle,),
                        ),
                        Text('${age}', style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(Icons.remove, color: Colors.white,),
                                  ),

                                ),
                                onTap: (){
                                  setState(() {
                                    addSubtractAge(false);

                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.1)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(Icons.add, color: Colors.white,),
                                    )
                                ),
                                onTap: (){
                                  setState(() {
                                    addSubtractAge(true);

                                  });
                                },
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          InkWell(
            child: Container(
              width: width,
              height: 70,
              color: Colors.pink,
              child: Center(
                child: Text('CALCULATE YOUR BMI', style: textTextStyle,),
              ),

            ),
            onTap: (){
              print("Ink Well Pressed");
              // BMI = WEIGHT in KG / Height * Height in Meter
              // CM to meters = CM / 100;
              var heightInMeter = heightNumber / 100;
              print(heightInMeter);
              var BMI = weight / (heightInMeter * heightInMeter);
              print(BMI);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(result: BMI,)));
            },
          ),
        ],
      ),
    );
  }
}
