import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const double bottomContainerHeight = 80;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;
  //1 - male, 2 - female
  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == inactiveCardColor) {
        maleCardColour = activeCardColor;
        femaleCardColour = inactiveCardColor;
      } else {
        maleCardColour = inactiveCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColour == inactiveCardColor) {
        femaleCardColour = activeCardColor;
        maleCardColour = inactiveCardColor;
      } else {
        femaleCardColour = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCode(
                      color: maleCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCode(
                      color: femaleCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCode(
              color: activeCardColor,
              cardChild: Container(),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCode(
                      color: activeCardColor, cardChild: Container()),
                ),
                Expanded(
                  child: ReusableCode(
                      color: activeCardColor, cardChild: Container()),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
