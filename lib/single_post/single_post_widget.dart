import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delete_post_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SinglePostWidget extends StatefulWidget {
  const SinglePostWidget({
    Key? key,
    this.postParamenter,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? postParamenter;
  final UsersRecord? userRef;

  @override
  _SinglePostWidgetState createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<SinglePostWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  TextEditingController? commentBoxController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    commentBoxController = TextEditingController();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SinglePost'});
  }

  @override
  void dispose() {
    commentBoxController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.postParamenter!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCircle(
                color: Color(0xFF33C283),
                size: 50,
              ),
            ),
          );
        }
        final singlePostPostsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                logFirebaseEvent('SINGLE_POST_PAGE_angleLeft_ICN_ON_TAP');
                logFirebaseEvent('IconButton_Navigate-Back');
                context.pop();
              },
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  if (!singlePostPostsRecord.therePhoto!)
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Container(
                                        width: 100,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ),
                                  if (singlePostPostsRecord.therePhoto ?? true)
                                    FlutterFlowMediaDisplay(
                                      path: singlePostPostsRecord.photo!,
                                      imageBuilder: (path) => ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          path,
                                          width: 330,
                                          height: 170,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      videoPlayerBuilder: (path) =>
                                          FlutterFlowVideoPlayer(
                                        path: path,
                                        width: 300,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                    ),
                                ],
                              ),
                              Stack(
                                children: [
                                  if (singlePostPostsRecord.therePDF ?? true)
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: FlutterFlowPdfViewer(
                                        networkPath:
                                            singlePostPostsRecord.file!,
                                        height: 300,
                                        horizontalScroll: true,
                                      ),
                                    ),
                                  if (!singlePostPostsRecord.therePDF!)
                                    Container(
                                      width: 100,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        widget.userRef!.photoUrl!,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        widget.userRef!.displayName!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          if (singlePostPostsRecord.postOwner ??
                                              true)
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SINGLE_POST_PAGE_Icon_d1e46z68_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_Bottom-Sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: DeletePostWidget(
                                                        postParameter:
                                                            singlePostPostsRecord,
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Icon(
                                                Icons.keyboard_control,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                                size: 20,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      singlePostPostsRecord.description!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                if (!singlePostPostsRecord
                                                    .useful!
                                                    .toList()
                                                    .contains(
                                                        currentUserReference))
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SINGLE_POST_PAGE_Icon_auhir2gv_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_Backend-Call');

                                                      final postsUpdateData = {
                                                        'Useful': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await singlePostPostsRecord
                                                          .reference
                                                          .update(
                                                              postsUpdateData);
                                                      logFirebaseEvent(
                                                          'Icon_Widget-Animation');
                                                      if (animationsMap[
                                                              'iconOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'iconOnActionTriggerAnimation']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons.circle,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'iconOnActionTriggerAnimation']!,
                                                  ),
                                                if (singlePostPostsRecord
                                                    .useful!
                                                    .toList()
                                                    .contains(
                                                        currentUserReference))
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SINGLE_POST_PAGE_Icon_f40y7yr0_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_Backend-Call');

                                                      final postsUpdateData = {
                                                        'Useful': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      };
                                                      await singlePostPostsRecord
                                                          .reference
                                                          .update(
                                                              postsUpdateData);
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      color: Colors.black,
                                                      size: 24,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              functions
                                                  .useful(singlePostPostsRecord)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        fontSize: 12,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 5, 0),
                                              child: Icon(
                                                FFIcons.kcommentQuestion,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              singlePostPostsRecord.numComments!
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        fontSize: 12,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: StreamBuilder<List<PostCommentsRecord>>(
                      stream: queryPostCommentsRecord(
                        queryBuilder: (postCommentsRecord) => postCommentsRecord
                            .where('post',
                                isEqualTo: singlePostPostsRecord.reference)
                            .orderBy('timePosted'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitCircle(
                                color: Color(0xFF33C283),
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<PostCommentsRecord> columnPostCommentsRecordList =
                            snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(columnPostCommentsRecordList.length,
                                  (columnIndex) {
                            final columnPostCommentsRecord =
                                columnPostCommentsRecordList[columnIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    columnPostCommentsRecord.user!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitCircle(
                                          color: Color(0xFF33C283),
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  final rowUsersRecord = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SINGLE_POST_PAGE_Image_ibf2z9kw_ON_TAP');
                                          logFirebaseEvent('Image_Navigate-To');

                                          context.pushNamed(
                                            'ProfilePageOTHERS',
                                            queryParams: {
                                              'userDetails': serializeParam(
                                                rowUsersRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userDetails': rowUsersRecord,
                                            },
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.network(
                                            rowUsersRecord.photoUrl!,
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.75,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 8, 12, 8),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rowUsersRecord
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Text(
                                                      columnPostCommentsRecord
                                                          .comment!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 0, 0),
                                            child: Text(
                                              dateTimeFormat(
                                                'relative',
                                                columnPostCommentsRecord
                                                    .timePosted!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x26000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 4, 0),
                                        child: TextFormField(
                                          controller: commentBoxController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Leave comment...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 16, 10, 0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                          maxLines: 4,
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SINGLE_POST_PAGE_POST_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_Backend-Call');

                                          final postCommentsCreateData =
                                              createPostCommentsRecordData(
                                            timePosted: getCurrentTimestamp,
                                            comment: commentBoxController!.text,
                                            user: currentUserReference,
                                            post:
                                                singlePostPostsRecord.reference,
                                          );
                                          await PostCommentsRecord.collection
                                              .doc()
                                              .set(postCommentsCreateData);
                                          logFirebaseEvent(
                                              'Button_Backend-Call');

                                          final postsUpdateData = {
                                            'numComments':
                                                FieldValue.increment(1),
                                          };
                                          await singlePostPostsRecord.reference
                                              .update(postsUpdateData);
                                        },
                                        text: 'Post',
                                        options: FFButtonOptions(
                                          width: 70,
                                          height: 40,
                                          color: Color(0xFF33C283),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2Family),
                                              ),
                                          elevation: 2,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
