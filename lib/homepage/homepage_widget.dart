import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../diary/diary_widget.dart';
import '../entry_details/entry_details_widget.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({Key key}) : super(key: key);

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  String radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Hey, ',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                AuthUserStreamWidget(
                  child: Text(
                    currentUserDisplayName,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                child: Material(
                  color: Colors.transparent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFFE7BC9D),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.network(
                          '',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0x00FBF4EF),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateTimeFormat('yMMMd', getCurrentTimestamp),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'How are you feeling today?',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w300,
                                      ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FlutterFlowRadioButton(
                            options: ['Awful', 'Bad', 'Okay', 'Good', 'Awesome']
                                .toList(),
                            initialValue: 'Okay',
                            onChanged: (value) {
                              setState(() => radioButtonValue = value);
                            },
                            optionHeight: 30,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.horizontal,
                            radioButtonColor: Color(0xC851574C),
                            inactiveRadioButtonColor: Color(0xFFF7E9DE),
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.center,
                            verticalAlignment: WrapCrossAlignment.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiaryWidget(
                                    mood: radioButtonValue,
                                  ),
                                ),
                              );
                            },
                            text: 'Continue',
                            options: FFButtonOptions(
                              width: 160,
                              height: 50,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 2,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Text(
                      'My latest entries',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder<List<EntriesRecord>>(
                  stream: queryEntriesRecord(
                    queryBuilder: (entriesRecord) => entriesRecord
                        .where('user', isEqualTo: currentUserReference)
                        .orderBy('entrydate', descending: true),
                    limit: 100,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<EntriesRecord> entriesEntriesRecordList =
                        snapshot.data;
                    if (entriesEntriesRecordList.isEmpty) {
                      return Image.asset(
                        'assets/images/Screen_Shot_2022-04-06_at_10.34.24.png',
                        width: MediaQuery.of(context).size.width,
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(entriesEntriesRecordList.length,
                            (entriesIndex) {
                          final entriesEntriesRecord =
                              entriesEntriesRecordList[entriesIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Color(0x0FFFFFFF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                                child: StreamBuilder<EntriesRecord>(
                                  stream: EntriesRecord.getDocument(
                                      entriesEntriesRecord.reference),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final rowEntriesRecord = snapshot.data;
                                    return InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EntryDetailsWidget(
                                              entryReference:
                                                  entriesEntriesRecord
                                                      .reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 3,
                                                  height: 195,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                height: 185,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0.1),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                entriesEntriesRecord
                                                                    .entryname,
                                                                'My journal entry',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w200,
                                                                  ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.arrow_forward,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 28,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            dateTimeFormat(
                                                                'relative',
                                                                entriesEntriesRecord
                                                                    .entrydate),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 15,
                                                                    0, 0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              entriesEntriesRecord
                                                                  .entryimage,
                                                              'data:image/jpeg;base64,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',
                                                            ),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.19,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
