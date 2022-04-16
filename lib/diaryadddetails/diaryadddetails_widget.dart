import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DiaryadddetailsWidget extends StatefulWidget {
  const DiaryadddetailsWidget({
    Key key,
    this.entrydescription,
    this.mood,
  }) : super(key: key);

  final String entrydescription;
  final String mood;

  @override
  _DiaryadddetailsWidgetState createState() => _DiaryadddetailsWidgetState();
}

class _DiaryadddetailsWidgetState extends State<DiaryadddetailsWidget> {
  String uploadedFileUrl = '';
  TextEditingController entrynameController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    entrynameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Text(
            'Almost done!',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 22, 0),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(22, 20, 22, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                'assets/images/undraw_well_done_i2wr_(4).svg',
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Give the entry a name',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onFieldSubmitted: (_) async {
                                    final entriesCreateData =
                                        createEntriesRecordData(
                                      entryname: '',
                                    );
                                    await EntriesRecord.collection
                                        .doc()
                                        .set(entriesCreateData);
                                  },
                                  controller: entrynameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF8B97A2),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                      ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add an image  (optional)',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      fillColor: Color(0x00F3C891),
                      icon: Icon(
                        Icons.upload_sharp,
                        color: FlutterFlowTheme.of(context).alternate,
                        size: 47,
                      ),
                      onPressed: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          final downloadUrls = await Future.wait(
                              selectedMedia.map((m) async =>
                                  await uploadData(m.storagePath, m.bytes)));
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrls != null) {
                            setState(
                                () => uploadedFileUrl = downloadUrls.first);
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            showUploadMessage(
                              context,
                              'Failed to upload media',
                            );
                            return;
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final entriesCreateData = createEntriesRecordData(
                      entrydate: getCurrentTimestamp,
                      entrydescription: widget.entrydescription,
                      entryimage: uploadedFileUrl,
                      entryname: entrynameController.text,
                      user: currentUserReference,
                      mood: widget.mood,
                    );
                    await EntriesRecord.collection.doc().set(entriesCreateData);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'Homepage'),
                      ),
                    );
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    width: 200,
                    height: 57,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
