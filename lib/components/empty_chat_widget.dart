import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyChatWidget extends StatefulWidget {
  const EmptyChatWidget({
    Key? key,
    this.title,
    this.bodytext,
  }) : super(key: key);

  final String? title;
  final String? bodytext;

  @override
  _EmptyChatWidgetState createState() => _EmptyChatWidgetState();
}

class _EmptyChatWidgetState extends State<EmptyChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              if (Theme.of(context).brightness == Brightness.dark)
                Image.asset(
                  'assets/images/noMessagesDark@2x.png',
                  width: 230,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              if (!(Theme.of(context).brightness == Brightness.dark))
                Image.asset(
                  'assets/images/Progetto_senza_titolo-5.png',
                  width: 230,
                  height: 230,
                  fit: BoxFit.cover,
                ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.title,
                    'No message',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    valueOrDefault<String>(
                      widget.bodytext,
                      'It looks like is empty here! 👀',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).subtitle2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
