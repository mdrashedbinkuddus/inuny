import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoReviewsWidget extends StatefulWidget {
  const NoReviewsWidget({
    Key? key,
    this.title,
    this.bodytext,
  }) : super(key: key);

  final String? title;
  final String? bodytext;

  @override
  _NoReviewsWidgetState createState() => _NoReviewsWidgetState();
}

class _NoReviewsWidgetState extends State<NoReviewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Progetto_senza_titolo-6.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).subtitle1.override(
                  fontFamily: FlutterFlowTheme.of(context).subtitle1Family,
                  fontSize: 16,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).subtitle1Family),
                ),
          ),
          Text(
            widget.bodytext!,
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                  fontSize: 14,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).subtitle2Family),
                ),
          ),
        ],
      ),
    );
  }
}
