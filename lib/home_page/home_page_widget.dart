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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation1': AnimationInfo(
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
    'iconOnActionTriggerAnimation2': AnimationInfo(
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
  PagingController<DocumentSnapshot?, PostsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          buttonSize: 60,
          icon: Icon(
            FFIcons.kvideoCameraAlt,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('HOME_PAGE_PAGE_videoCameraAlt_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-To');

            context.pushNamed('StudyRooms');
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              icon: Icon(
                FFIcons.ksearch,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () async {
                logFirebaseEvent('HOME_PAGE_PAGE_search_ICN_ON_TAP');
                logFirebaseEvent('IconButton_Navigate-To');

                context.pushNamed('HomeSearch');
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 44,
              icon: Icon(
                FFIcons.kbellRing,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.of(context).customColor1,
                      unselectedLabelColor: Color(0xFF1B1818),
                      labelStyle: FlutterFlowTheme.of(context).bodyText1,
                      indicatorColor: Color(0xFF33C283),
                      tabs: [
                        Tab(
                          text: 'Trends',
                        ),
                        Tab(
                          text: 'Following',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          StreamBuilder<List<PostsRecord>>(
                            stream: queryPostsRecord(
                              queryBuilder: (postsRecord) =>
                                  postsRecord.orderBy('date', descending: true),
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
                              List<PostsRecord> listViewPostsRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewPostsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewPostsRecord =
                                      listViewPostsRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 0),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          listViewPostsRecord.postUser!),
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
                                        final containerUsersRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_xz023nek_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_Navigate-To');

                                            context.pushNamed(
                                              'SinglePost',
                                              queryParams: {
                                                'postParamenter':
                                                    serializeParam(
                                                  listViewPostsRecord.reference,
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
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (!listViewPostsRecord
                                                            .therePhoto!)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Container(
                                                              width: 100,
                                                              height: 10,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        if (listViewPostsRecord
                                                                .therePhoto ??
                                                            true)
                                                          FlutterFlowMediaDisplay(
                                                            path:
                                                                listViewPostsRecord
                                                                    .photo!,
                                                            imageBuilder:
                                                                (path) =>
                                                                    ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              child:
                                                                  Image.network(
                                                                path,
                                                                width: 330,
                                                                height: 170,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            videoPlayerBuilder:
                                                                (path) =>
                                                                    FlutterFlowVideoPlayer(
                                                              path: path,
                                                              width: 300,
                                                              autoPlay: false,
                                                              looping: true,
                                                              showControls:
                                                                  true,
                                                              allowFullScreen:
                                                                  true,
                                                              allowPlaybackSpeedMenu:
                                                                  false,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (listViewPostsRecord
                                                                .therePDF ??
                                                            true)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child:
                                                                FlutterFlowPdfViewer(
                                                              networkPath:
                                                                  listViewPostsRecord
                                                                      .file!,
                                                              height: 300,
                                                              horizontalScroll:
                                                                  true,
                                                            ),
                                                          ),
                                                        if (!listViewPostsRecord
                                                            .therePDF!)
                                                          Container(
                                                            width: 100,
                                                            height: 1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_CircleImage_4yo4f7f2_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'CircleImage_Navigate-To');

                                                              context.pushNamed(
                                                                'ProfilePageOTHERS',
                                                                queryParams: {
                                                                  'userDetails':
                                                                      serializeParam(
                                                                    containerUsersRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'userDetails':
                                                                      containerUsersRecord,
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                containerUsersRecord
                                                                    .photoUrl!,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HOME_PAGE_PAGE_Text_i38rjhby_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Text_Navigate-To');

                                                                context
                                                                    .pushNamed(
                                                                  'ProfilePageOTHERS',
                                                                  queryParams: {
                                                                    'userDetails':
                                                                        serializeParam(
                                                                      containerUsersRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <
                                                                      String,
                                                                      dynamic>{
                                                                    'userDetails':
                                                                        containerUsersRecord,
                                                                  },
                                                                );
                                                              },
                                                              child: Text(
                                                                containerUsersRecord
                                                                    .displayName!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                if (listViewPostsRecord
                                                                        .postOwner ??
                                                                    true)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_Icon_5j10igst_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_Bottom-Sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                DeletePostWidget(
                                                                              postParameter: listViewPostsRecord,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .keyboard_control,
                                                                      color: FlutterFlowTheme.of(
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            listViewPostsRecord
                                                                .description!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (!listViewPostsRecord
                                                                          .useful!
                                                                          .toList()
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_PAGE_Icon_dkuc8ox6_ON_TAP');
                                                                              logFirebaseEvent('Icon_Backend-Call');

                                                                              final postsUpdateData = {
                                                                                'Useful': FieldValue.arrayUnion([
                                                                                  currentUserReference
                                                                                ]),
                                                                              };
                                                                              await listViewPostsRecord.reference.update(postsUpdateData);
                                                                              logFirebaseEvent('Icon_Widget-Animation');
                                                                              if (animationsMap['iconOnActionTriggerAnimation1'] != null) {
                                                                                await animationsMap['iconOnActionTriggerAnimation1']!.controller.forward(from: 0.0);
                                                                              }
                                                                            },
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.circle,
                                                                              color: Colors.black,
                                                                              size: 20,
                                                                            ),
                                                                          ).animateOnActionTrigger(
                                                                            animationsMap['iconOnActionTriggerAnimation1']!,
                                                                          ),
                                                                        ),
                                                                      if (listViewPostsRecord
                                                                          .useful!
                                                                          .toList()
                                                                          .contains(
                                                                              currentUserReference))
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('HOME_PAGE_PAGE_Icon_2yugvvq6_ON_TAP');
                                                                            logFirebaseEvent('Icon_Backend-Call');

                                                                            final postsUpdateData =
                                                                                {
                                                                              'Useful': FieldValue.arrayRemove([
                                                                                currentUserReference
                                                                              ]),
                                                                            };
                                                                            await listViewPostsRecord.reference.update(postsUpdateData);
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle_outline_rounded,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      functions
                                                                          .useful(
                                                                              listViewPostsRecord)
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            fontSize:
                                                                                12,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kcommentQuestion,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 20,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    listViewPostsRecord
                                                                        .numComments!
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              12,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          PagedListView<DocumentSnapshot<Object?>?,
                              PostsRecord>(
                            pagingController: () {
                              final Query<Object?> Function(Query<Object?>)
                                  queryBuilder = (postsRecord) => postsRecord
                                      .orderBy('date', descending: true);
                              if (_pagingController != null) {
                                final query =
                                    queryBuilder(PostsRecord.collection);
                                if (query != _pagingQuery) {
                                  // The query has changed
                                  _pagingQuery = query;
                                  _streamSubscriptions
                                      .forEach((s) => s?.cancel());
                                  _streamSubscriptions.clear();
                                  _pagingController!.refresh();
                                }
                                return _pagingController!;
                              }

                              _pagingController =
                                  PagingController(firstPageKey: null);
                              _pagingQuery =
                                  queryBuilder(PostsRecord.collection);
                              _pagingController!
                                  .addPageRequestListener((nextPageMarker) {
                                queryPostsRecordPage(
                                  queryBuilder: (postsRecord) => postsRecord
                                      .orderBy('date', descending: true),
                                  nextPageMarker: nextPageMarker,
                                  pageSize: 25,
                                  isStream: true,
                                ).then((page) {
                                  _pagingController!.appendPage(
                                    page.data,
                                    page.nextPageMarker,
                                  );
                                  final streamSubscription =
                                      page.dataStream?.listen((data) {
                                    final itemIndexes = _pagingController!
                                        .itemList!
                                        .asMap()
                                        .map((k, v) =>
                                            MapEntry(v.reference.id, k));
                                    data.forEach((item) {
                                      final index =
                                          itemIndexes[item.reference.id];
                                      final items =
                                          _pagingController!.itemList!;
                                      if (index != null) {
                                        items.replaceRange(
                                            index, index + 1, [item]);
                                        _pagingController!.itemList = {
                                          for (var item in items)
                                            item.reference: item
                                        }.values.toList();
                                      }
                                    });
                                    setState(() {});
                                  });
                                  _streamSubscriptions.add(streamSubscription);
                                });
                              });
                              return _pagingController!;
                            }(),
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<PostsRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitCircle(
                                    color: Color(0xFF33C283),
                                    size: 50,
                                  ),
                                ),
                              ),

                              itemBuilder: (context, _, listViewIndex) {
                                final listViewPostsRecord =
                                    _pagingController!.itemList![listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        listViewPostsRecord.postUser!),
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
                                      final containerUsersRecord =
                                          snapshot.data!;
                                      return Material(
                                        color: Colors.transparent,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (!listViewPostsRecord
                                                        .therePhoto!)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Container(
                                                          width: 100,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                    if (listViewPostsRecord
                                                            .therePhoto ??
                                                        true)
                                                      FlutterFlowMediaDisplay(
                                                        path:
                                                            listViewPostsRecord
                                                                .photo!,
                                                        imageBuilder: (path) =>
                                                            ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          child: Image.network(
                                                            path,
                                                            width: 330,
                                                            height: 170,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        videoPlayerBuilder:
                                                            (path) =>
                                                                FlutterFlowVideoPlayer(
                                                          path: path,
                                                          width: 300,
                                                          autoPlay: false,
                                                          looping: true,
                                                          showControls: true,
                                                          allowFullScreen: true,
                                                          allowPlaybackSpeedMenu:
                                                              false,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    if (listViewPostsRecord
                                                            .therePDF ??
                                                        true)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child:
                                                            FlutterFlowPdfViewer(
                                                          networkPath:
                                                              listViewPostsRecord
                                                                  .file!,
                                                          height: 300,
                                                          horizontalScroll:
                                                              true,
                                                        ),
                                                      ),
                                                    if (!listViewPostsRecord
                                                        .therePDF!)
                                                      Container(
                                                        width: 100,
                                                        height: 1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 40,
                                                        height: 40,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          containerUsersRecord
                                                              .photoUrl!,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          containerUsersRecord
                                                              .displayName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (listViewPostsRecord
                                                                    .postOwner ??
                                                                true)
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_PAGE_PAGE_Icon_qz2mqx0e_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_Bottom-Sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            DeletePostWidget(
                                                                          postParameter:
                                                                              listViewPostsRecord,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .keyboard_control,
                                                                  color: FlutterFlowTheme.of(
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        listViewPostsRecord
                                                            .description!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (!listViewPostsRecord
                                                                      .useful!
                                                                      .toList()
                                                                      .contains(
                                                                          currentUserReference))
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'HOME_PAGE_PAGE_Icon_8hxz8h6w_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_Backend-Call');

                                                                          final postsUpdateData =
                                                                              {
                                                                            'Useful':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                          };
                                                                          await listViewPostsRecord
                                                                              .reference
                                                                              .update(postsUpdateData);
                                                                          logFirebaseEvent(
                                                                              'Icon_Widget-Animation');
                                                                          if (animationsMap['iconOnActionTriggerAnimation2'] !=
                                                                              null) {
                                                                            await animationsMap['iconOnActionTriggerAnimation2']!.controller.forward(from: 0.0);
                                                                          }
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circle,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ).animateOnActionTrigger(
                                                                        animationsMap[
                                                                            'iconOnActionTriggerAnimation2']!,
                                                                      ),
                                                                    ),
                                                                  if (listViewPostsRecord
                                                                      .useful!
                                                                      .toList()
                                                                      .contains(
                                                                          currentUserReference))
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_PAGE_PAGE_Icon_bh5x3a1r_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_Backend-Call');

                                                                        final usersUpdateData =
                                                                            {
                                                                          'Followers':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        };
                                                                        await containerUsersRecord
                                                                            .reference
                                                                            .update(usersUpdateData);
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle_outline_rounded,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  functions
                                                                      .useful(
                                                                          listViewPostsRecord)
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontSize:
                                                                            12,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kcommentQuestion,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                              Text(
                                                                listViewPostsRecord
                                                                    .numComments!
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      fontSize:
                                                                          12,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
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
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
