import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteEntryWidget extends StatefulWidget {
  const DeleteEntryWidget({
    Key key,
    this.entryparameters,
  }) : super(key: key);

  final EntriesRecord entryparameters;

  @override
  _DeleteEntryWidgetState createState() => _DeleteEntryWidgetState();
}

class _DeleteEntryWidgetState extends State<DeleteEntryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FFButtonWidget(
              onPressed: () async {
                await widget.entryparameters.reference.delete();
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'Homepage'),
                  ),
                );
              },
              text: 'Delete Entry',
              options: FFButtonOptions(
                width: 200,
                height: 50,
                color: Color(0xFFBA0C36),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 18,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: 200,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 3,
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
      ],
    );
  }
}
