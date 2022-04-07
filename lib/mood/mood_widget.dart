import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodWidget extends StatefulWidget {
  const MoodWidget({Key key}) : super(key: key);

  @override
  _MoodWidgetState createState() => _MoodWidgetState();
}

class _MoodWidgetState extends State<MoodWidget> {
  String radioButtonValue;
  double sliderValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Slider(
                activeColor: FlutterFlowTheme.of(context).primaryColor,
                inactiveColor: Color(0xFF9E9E9E),
                min: 1,
                max: 10,
                value: sliderValue ??= 1,
                onChanged: (newValue) {
                  setState(() => sliderValue = newValue);
                },
              ),
              FlutterFlowRadioButton(
                options: ['Awful', 'Bad', 'Okay', 'Good', 'Awesome'].toList(),
                onChanged: (value) {
                  setState(() => radioButtonValue = value);
                },
                optionHeight: 25,
                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                buttonPosition: RadioButtonPosition.left,
                direction: Axis.horizontal,
                radioButtonColor: FlutterFlowTheme.of(context).alternate,
                inactiveRadioButtonColor: Color(0x8A000000),
                toggleable: false,
                horizontalAlignment: WrapAlignment.center,
                verticalAlignment: WrapCrossAlignment.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
