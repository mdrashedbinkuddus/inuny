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
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  _HomeSearchWidgetState createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget>
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
  List<PostsRecord> simpleSearchResults = [];
  TextEditingController? textController;
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomeSearch'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 40,
            icon: Icon(
              FFIcons.kangleLeft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20,
            ),
            onPressed: () async {
              logFirebaseEvent('HOME_SEARCH_PAGE_angleLeft_ICN_ON_TAP');
              logFirebaseEvent('IconButton_Navigate-Back');
              context.pop();
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      onFieldSubmitted: (_) async {
                        logFirebaseEvent(
                            'HOME_SEARCH_TextField_ke4by8n5_ON_TEXTFI');
                        logFirebaseEvent('TextField_Simple-Search');
                        await queryPostsRecordOnce()
                            .then(
                              (records) => simpleSearchResults = TextSearch(
                                records
                                    .map(
                                      (record) => TextSearchItem(record, [
                                        record.fullName!,
                                        record.description!
                                      ]),
                                    )
                                    .toList(),
                              )
                                  .search(textController!.text)
                                  .map((r) => r.object)
                                  .toList(),
                            )
                            .onError((_, __) => simpleSearchResults = [])
                            .whenComplete(() => setState(() {}));

                        logFirebaseEvent('TextField_Update-Local-State');
                        setState(() => FFAppState().showFullList = false);
                      },
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0B0B),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0B0B),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      maxLines: 1,
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 40,
                    icon: Icon(
                      FFIcons.ksearch,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 40,
                    icon: Icon(
                      Icons.highlight_off_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'HOME_SEARCH_highlight_off_rounded_ICN_ON');
                      logFirebaseEvent('IconButton_Update-Local-State');
                      setState(() => FFAppState().showFullList = true);
                      logFirebaseEvent('IconButton_Clear-Text-Fields');
                      setState(() {
                        textController?.clear();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Visibility(
          visible: !FFAppState().showFullList,
          child: Builder(
            builder: (context) {
              final searchResults = simpleSearchResults.toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: searchResults.length,
                itemBuilder: (context, searchResultsIndex) {
                  final searchResultsItem = searchResults[searchResultsIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: StreamBuilder<UsersRecord>(
                      stream:
                          UsersRecord.getDocument(searchResultsItem.postUser!),
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
                        final containerUsersRecord = snapshot.data!;
                        return InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_SEARCH_Container_g4x7y23i_ON_TAP');
                            logFirebaseEvent('Container_Navigate-To');

                            context.pushNamed(
                              'SinglePost',
                              queryParams: {
                                'postParamenter': serializeParam(
                                  searchResultsItem.reference,
                                  ParamType.DocumentReference,
                                ),
                                'userRef': serializeParam(
                                  containerUsersRecord,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'userRef': containerUsersRecord,
                              },
                            );
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        if (!searchResultsItem.therePhoto!)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: 100,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                          ),
                                        if (searchResultsItem.therePhoto ??
                                            true)
                                          FlutterFlowMediaDisplay(
                                            path: searchResultsItem.photo!,
                                            imageBuilder: (path) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
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
                                        if (searchResultsItem.therePDF ?? true)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: FlutterFlowPdfViewer(
                                              networkPath:
                                                  searchResultsItem.file!,
                                              height: 300,
                                              horizontalScroll: true,
                                            ),
                                          ),
                                        if (!searchResultsItem.therePDF!)
                                          Container(
                                            width: 100,
                                            height: 1,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_SEARCH_CircleImage_i2zzxt1l_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_Navigate-To');

                                              context.pushNamed(
                                                'ProfilePageOTHERS',
                                                queryParams: {
                                                  'userDetails': serializeParam(
                                                    containerUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userDetails':
                                                      containerUsersRecord,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                containerUsersRecord.photoUrl!,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HOME_SEARCH_PAGE_Text_zjsmlag7_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_Navigate-To');

                                                context.pushNamed(
                                                  'ProfilePageOTHERS',
                                                  queryParams: {
                                                    'userDetails':
                                                        serializeParam(
                                                      containerUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userDetails':
                                                        containerUsersRecord,
                                                  },
                                                );
                                              },
                                              child: Text(
                                                containerUsersRecord
                                                    .displayName!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (searchResultsItem
                                                        .postOwner ??
                                                    true)
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'HOME_SEARCH_PAGE_Icon_68m5jucf_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_Bottom-Sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                DeletePostWidget(
                                                              postParameter:
                                                                  searchResultsItem,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Icon(
                                                      Icons.keyboard_control,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            searchResultsItem.description!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: StreamBuilder<PostsRecord>(
                                        stream: PostsRecord.getDocument(
                                            searchResultsItem.reference),
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
                                          final postInteractionsPostsRecord =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (!postInteractionsPostsRecord
                                                              .useful!
                                                              .toList()
                                                              .contains(
                                                                  currentUserReference))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_SEARCH_PAGE_Icon_w62u0xd1_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_Backend-Call');

                                                                  final postsUpdateData =
                                                                      {
                                                                    'Useful':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      currentUserReference
                                                                    ]),
                                                                  };
                                                                  await postInteractionsPostsRecord
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
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .circle,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 20,
                                                                ),
                                                              ).animateOnActionTrigger(
                                                                animationsMap[
                                                                    'iconOnActionTriggerAnimation']!,
                                                              ),
                                                            ),
                                                          if (postInteractionsPostsRecord
                                                              .useful!
                                                              .toList()
                                                              .contains(
                                                                  currentUserReference))
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HOME_SEARCH_PAGE_Icon_fxtz3vtl_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_Backend-Call');

                                                                final postsUpdateData =
                                                                    {
                                                                  'Useful':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    currentUserReference
                                                                  ]),
                                                                };
                                                                await postInteractionsPostsRecord
                                                                    .reference
                                                                    .update(
                                                                        postsUpdateData);
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .check_circle_outline_rounded,
                                                                color: Colors
                                                                    .black,
                                                                size: 24,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Text(
                                                        functions
                                                            .useful(
                                                                postInteractionsPostsRecord)
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  fontSize: 12,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    5, 0),
                                                        child: Icon(
                                                          FFIcons
                                                              .kcommentQuestion,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Text(
                                                        searchResultsItem
                                                            .numComments!
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  fontSize: 12,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
