import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).lineColor,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).lineColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 48,
          icon: Icon(
            FFIcons.kangleLeft,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 18,
          ),
          onPressed: () async {
            logFirebaseEvent('CHAT_PAGE_PAGE_angleLeft_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: InkWell(
          onTap: () async {
            logFirebaseEvent('CHAT_PAGE_PAGE_Text_d8zwv0jx_ON_TAP');
            logFirebaseEvent('Text_Navigate-To');

            context.pushNamed(
              'ProfilePageOTHERS',
              queryParams: {
                'userDetails': serializeParam(
                  widget.chatUser,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'userDetails': widget.chatUser,
              },
            );
          },
          child: Text(
            widget.chatUser!.displayName!,
            style: FlutterFlowTheme.of(context).subtitle2,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<FFChatInfo>(
        stream: FFChatManager.instance.getChatInfo(
          otherUserRecord: widget.chatUser,
          chatReference: widget.chatRef,
        ),
        builder: (context, snapshot) => snapshot.hasData
            ? FFChatPage(
                chatInfo: snapshot.data!,
                allowImages: true,
                backgroundColor: Color(0xFF22282F),
                timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                currentUserBoxDecoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                otherUsersBoxDecoration: BoxDecoration(
                  color: Color(0xFF33C283),
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                currentUserTextStyle:
                    FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).lineColor,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                otherUsersTextStyle: FlutterFlowTheme.of(context).bodyText1,
                inputHintTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: Color(0xFF95A1AC),
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                inputTextStyle: GoogleFonts.getFont(
                  'DM Sans',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              )
            : Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitCircle(
                    color: Color(0xFF33C283),
                    size: 50,
                  ),
                ),
              ),
      ),
    );
  }
}
