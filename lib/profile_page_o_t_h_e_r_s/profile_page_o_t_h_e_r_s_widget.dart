import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/curriculum_copy_widget.dart';
import '../components/delete_post_widget.dart';
import '../components/uni_contacts_widget.dart';
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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProfilePageOTHERSWidget extends StatefulWidget {
  const ProfilePageOTHERSWidget({
    Key? key,
    this.userDetails,
  }) : super(key: key);

  final UsersRecord? userDetails;

  @override
  _ProfilePageOTHERSWidgetState createState() =>
      _ProfilePageOTHERSWidgetState();
}

class _ProfilePageOTHERSWidgetState extends State<ProfilePageOTHERSWidget> {
  PagingController<DocumentSnapshot?, PostsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfilePageOTHERS'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userDetails!.reference),
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
        final profilePageOTHERSUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional(0, -1),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Image.network(
                      valueOrDefault<String>(
                        profilePageOTHERSUsersRecord.photoUrl,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/app-i-1b3ur4/assets/g81f1b2dafgh/Aggiungi%20corpo%20del%20testo-3.png',
                      ),
                      width: double.infinity,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -0.87),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x520E151B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                FFIcons.kangleLeft,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PROFILE_O_T_H_E_R_S_angleLeft_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_Navigate-Back');
                                context.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 700,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x320E151B),
                                      offset: Offset(0, -2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  profilePageOTHERSUsersRecord
                                                      .displayName,
                                                  'Anonimous',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_O_T_H_E_R_S_Card_ojfb07ei_ON_TAP');
                                                if (profilePageOTHERSUsersRecord
                                                    .isUniversity!) {
                                                  logFirebaseEvent(
                                                      'Card_Bottom-Sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child:
                                                            UniContactsWidget(),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                } else {
                                                  logFirebaseEvent(
                                                      'Card_Navigate-To');

                                                  context.pushNamed(
                                                      'ExperienceCurriculum_New');
                                                }
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0x00F5F5F5),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 40,
                                                  fillColor: Color(0x0033C283),
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.info,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 20,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFILE_O_T_H_E_R_S_info_ICN_ON_TAP');
                                                    if (profilePageOTHERSUsersRecord
                                                        .isUniversity!) {
                                                      logFirebaseEvent(
                                                          'IconButton_Bottom-Sheet');
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
                                                                UniContactsWidget(),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    } else {
                                                      logFirebaseEvent(
                                                          'IconButton_Bottom-Sheet');
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
                                                                CurriculumCopyWidget(
                                                              userDetails:
                                                                  profilePageOTHERSUsersRecord,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 1, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            if (!profilePageOTHERSUsersRecord
                                                .isUniversity!)
                                              Text(
                                                profilePageOTHERSUsersRecord
                                                    .university!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                            if (profilePageOTHERSUsersRecord
                                                    .isUniversity ??
                                                true)
                                              Text(
                                                profilePageOTHERSUsersRecord
                                                    .state!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 10, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 16, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    functions
                                                        .numFollowers(
                                                            profilePageOTHERSUsersRecord)
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (!profilePageOTHERSUsersRecord
                                                        .followers!
                                                        .toList()
                                                        .contains(
                                                            currentUserReference))
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_O_T_H_E_R_S_FOLLOW_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_Backend-Call');

                                                          final usersUpdateData =
                                                              {
                                                            'Followers':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          };
                                                          await widget
                                                              .userDetails!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        text: 'Follow',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).subtitle2Family),
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    if (profilePageOTHERSUsersRecord
                                                        .followers!
                                                        .toList()
                                                        .contains(
                                                            currentUserReference))
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_O_T_H_E_R_S_FOLLOWING_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_Backend-Call');

                                                          final usersUpdateData =
                                                              {
                                                            'Followers':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          };
                                                          await widget
                                                              .userDetails!
                                                              .reference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                        text: 'Following',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).subtitle2Family),
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_O_T_H_E_R_S_MESSAGE_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_Navigate-To');

                                                context.pushNamed(
                                                  'ChatPage',
                                                  queryParams: {
                                                    'chatUser': serializeParam(
                                                      profilePageOTHERSUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'chatUser':
                                                        profilePageOTHERSUsersRecord,
                                                  },
                                                );
                                              },
                                              text: 'Message',
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color: Color(0x00FFFFFF),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color:
                                                              Color(0xFF292D39),
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: DefaultTabController(
                                            length: 1,
                                            initialIndex: 0,
                                            child: Column(
                                              children: [
                                                TabBar(
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  unselectedLabelColor:
                                                      Color(0x0057636C),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle1,
                                                  indicatorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  tabs: [
                                                    Tab(
                                                      text: 'Posts',
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    children: [
                                                      PagedListView<
                                                          DocumentSnapshot<
                                                              Object?>?,
                                                          PostsRecord>(
                                                        pagingController: () {
                                                          final Query<Object?> Function(
                                                                  Query<Object?>)
                                                              queryBuilder =
                                                              (postsRecord) => postsRecord
                                                                  .where(
                                                                      'postUser',
                                                                      isEqualTo:
                                                                          profilePageOTHERSUsersRecord
                                                                              .reference)
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true);
                                                          if (_pagingController !=
                                                              null) {
                                                            final query =
                                                                queryBuilder(
                                                                    PostsRecord
                                                                        .collection);
                                                            if (query !=
                                                                _pagingQuery) {
                                                              // The query has changed
                                                              _pagingQuery =
                                                                  query;
                                                              _streamSubscriptions
                                                                  .forEach((s) =>
                                                                      s?.cancel());
                                                              _streamSubscriptions
                                                                  .clear();
                                                              _pagingController!
                                                                  .refresh();
                                                            }
                                                            return _pagingController!;
                                                          }

                                                          _pagingController =
                                                              PagingController(
                                                                  firstPageKey:
                                                                      null);
                                                          _pagingQuery =
                                                              queryBuilder(
                                                                  PostsRecord
                                                                      .collection);
                                                          _pagingController!
                                                              .addPageRequestListener(
                                                                  (nextPageMarker) {
                                                            queryPostsRecordPage(
                                                              queryBuilder: (postsRecord) => postsRecord
                                                                  .where(
                                                                      'postUser',
                                                                      isEqualTo:
                                                                          profilePageOTHERSUsersRecord
                                                                              .reference)
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true),
                                                              nextPageMarker:
                                                                  nextPageMarker,
                                                              pageSize: 25,
                                                              isStream: true,
                                                            ).then((page) {
                                                              _pagingController!
                                                                  .appendPage(
                                                                page.data,
                                                                page.nextPageMarker,
                                                              );
                                                              final streamSubscription =
                                                                  page
                                                                      .dataStream
                                                                      ?.listen(
                                                                          (data) {
                                                                final itemIndexes = _pagingController!
                                                                    .itemList!
                                                                    .asMap()
                                                                    .map((k,
                                                                            v) =>
                                                                        MapEntry(
                                                                            v.reference.id,
                                                                            k));
                                                                data.forEach(
                                                                    (item) {
                                                                  final index =
                                                                      itemIndexes[item
                                                                          .reference
                                                                          .id];
                                                                  final items =
                                                                      _pagingController!
                                                                          .itemList!;
                                                                  if (index !=
                                                                      null) {
                                                                    items.replaceRange(
                                                                        index,
                                                                        index +
                                                                            1,
                                                                        [item]);
                                                                    _pagingController!
                                                                        .itemList = {
                                                                      for (var item
                                                                          in items)
                                                                        item.reference:
                                                                            item
                                                                    }
                                                                        .values
                                                                        .toList();
                                                                  }
                                                                });
                                                                setState(() {});
                                                              });
                                                              _streamSubscriptions
                                                                  .add(
                                                                      streamSubscription);
                                                            });
                                                          });
                                                          return _pagingController!;
                                                        }(),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        builderDelegate:
                                                            PagedChildBuilderDelegate<
                                                                PostsRecord>(
                                                          // Customize what your widget looks like when it's loading the first page.
                                                          firstPageProgressIndicatorBuilder:
                                                              (_) => Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: Color(
                                                                    0xFF33C283),
                                                                size: 50,
                                                              ),
                                                            ),
                                                          ),

                                                          itemBuilder: (context,
                                                              _,
                                                              listViewIndex) {
                                                            final listViewPostsRecord =
                                                                _pagingController!
                                                                        .itemList![
                                                                    listViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          10),
                                                              child: StreamBuilder<
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        listViewPostsRecord
                                                                            .postUser!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            SpinKitCircle(
                                                                          color:
                                                                              Color(0xFF33C283),
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final containerUsersRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'PROFILE_O_T_H_E_R_S_Container_8f1y3zab_O');
                                                                      logFirebaseEvent(
                                                                          'Container_Navigate-To');

                                                                      context
                                                                          .pushNamed(
                                                                        'SinglePost',
                                                                        queryParams:
                                                                            {
                                                                          'postParamenter':
                                                                              serializeParam(
                                                                            listViewPostsRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'userRef':
                                                                              serializeParam(
                                                                            profilePageOTHERSUsersRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'userRef':
                                                                              profilePageOTHERSUsersRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          2,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  if (!listViewPostsRecord.therePhoto!)
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0, 0),
                                                                                      child: Container(
                                                                                        width: 100,
                                                                                        height: 10,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  if (listViewPostsRecord.therePhoto ?? true)
                                                                                    FlutterFlowMediaDisplay(
                                                                                      path: listViewPostsRecord.photo!,
                                                                                      imageBuilder: (path) => ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(16),
                                                                                        child: Image.network(
                                                                                          path,
                                                                                          width: 330,
                                                                                          height: 170,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
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
                                                                                  if (listViewPostsRecord.therePDF ?? true)
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0, 0),
                                                                                      child: FlutterFlowPdfViewer(
                                                                                        networkPath: listViewPostsRecord.file!,
                                                                                        height: 300,
                                                                                        horizontalScroll: true,
                                                                                      ),
                                                                                    ),
                                                                                  if (!listViewPostsRecord.therePDF!)
                                                                                    Container(
                                                                                      width: 100,
                                                                                      height: 1,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                                                                                        profilePageOTHERSUsersRecord.photoUrl!,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                      child: Text(
                                                                                        containerUsersRecord.displayName!,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('PROFILE_O_T_H_E_R_S_Icon_8jr1boym_ON_TAP');
                                                                                              logFirebaseEvent('Icon_Bottom-Sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: DeletePostWidget(
                                                                                                      postParameter: listViewPostsRecord,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => setState(() {}));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.keyboard_control,
                                                                                              color: FlutterFlowTheme.of(context).grayIcon,
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
                                                                                      listViewPostsRecord.description!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (!listViewPostsRecord.useful!.toList().contains(currentUserReference))
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                                child: InkWell(
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('PROFILE_O_T_H_E_R_S_Icon_2d0c27fi_ON_TAP');
                                                                                                    logFirebaseEvent('Icon_Backend-Call');

                                                                                                    final postsUpdateData = {
                                                                                                      ...createPostsRecordData(
                                                                                                        isUseful: true,
                                                                                                      ),
                                                                                                      'Useful': FieldValue.arrayUnion([currentUserReference]),
                                                                                                    };
                                                                                                    await listViewPostsRecord.reference.update(postsUpdateData);
                                                                                                  },
                                                                                                  child: FaIcon(
                                                                                                    FontAwesomeIcons.circle,
                                                                                                    color: Colors.black,
                                                                                                    size: 20,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (listViewPostsRecord.useful!.toList().contains(currentUserReference))
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('PROFILE_O_T_H_E_R_S_Icon_tn90d7zb_ON_TAP');
                                                                                                  logFirebaseEvent('Icon_Backend-Call');

                                                                                                  final postsUpdateData = {
                                                                                                    ...createPostsRecordData(
                                                                                                      isUseful: false,
                                                                                                    ),
                                                                                                    'Useful': FieldValue.arrayRemove([currentUserReference]),
                                                                                                  };
                                                                                                  await listViewPostsRecord.reference.update(postsUpdateData);
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.check_circle_outline_rounded,
                                                                                                  color: Colors.black,
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              functions.useful(listViewPostsRecord).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                    fontSize: 12,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                                                                                              child: Icon(
                                                                                                FFIcons.kcommentQuestion,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 20,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              listViewPostsRecord.numComments!.toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                    fontSize: 12,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                    ],
                                  ),
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
