import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPostsWidget extends StatefulWidget {
  const NewPostsWidget({Key? key}) : super(key: key);

  @override
  _NewPostsWidgetState createState() => _NewPostsWidgetState();
}

class _NewPostsWidgetState extends State<NewPostsWidget> {
  bool isMediaUploading1 = false;
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  String uploadedFileUrl2 = '';

  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBtnText,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 80, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      FFIcons.kangleLeft,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('NEW_POSTS_COMP_angleLeft_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_Navigate-To');

                      context.pushNamed('ProfilePage');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Create new post!',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: TextFormField(
                  controller: textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Here, you can say what you want!',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText2Family,
                          fontSize: 12,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText2Family),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Stack(
                children: [
                  if (!functions.hasUploadedPhoto(uploadedFileUrl1))
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  if (functions.hasUploadedPhoto(uploadedFileUrl1))
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: FlutterFlowMediaDisplay(
                          path: uploadedFileUrl1,
                          imageBuilder: (path) => ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              path,
                              width: double.infinity,
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
                      ),
                    ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            FFIcons.kpicture1,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'NEW_POSTS_COMP_picture1_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_Upload-Photo-Video');
                            final selectedMedia = await selectMedia(
                              imageQuality: 100,
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => isMediaUploading1 = true);
                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                isMediaUploading1 = false;
                              }
                              if (downloadUrls.length == selectedMedia.length) {
                                setState(() =>
                                    uploadedFileUrl1 = downloadUrls.first);
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload media');
                                return;
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        FFIcons.kdocumentSigned,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'NEW_POSTS_COMP_documentSigned_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_Upload-File');
                        final selectedFile =
                            await selectFile(allowedExtensions: ['pdf']);
                        if (selectedFile != null) {
                          setState(() => isMediaUploading2 = true);
                          String? downloadUrl;
                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            downloadUrl = await uploadData(
                                selectedFile.storagePath, selectedFile.bytes);
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            isMediaUploading2 = false;
                          }
                          if (downloadUrl != null) {
                            setState(() => uploadedFileUrl2 = downloadUrl!);
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            setState(() {});
                            showUploadMessage(
                              context,
                              'Failed to upload file',
                            );
                            return;
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  if (functions.hasUploadedDoc(uploadedFileUrl2))
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: FlutterFlowPdfViewer(
                          networkPath: uploadedFileUrl2,
                          height: 300,
                          horizontalScroll: true,
                        ),
                      ),
                    ),
                  if (!functions.hasUploadedDoc(uploadedFileUrl2))
                    Container(
                      width: 350,
                      height: 10,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'NEW_POSTS_CREATE_NEW_POST_BTN_ON_TAP');
                        logFirebaseEvent('Button_Backend-Call');

                        final postsCreateData = createPostsRecordData(
                          description: textController!.text,
                          date: getCurrentTimestamp,
                          postUser: currentUserReference,
                          postOwner: true,
                          file: uploadedFileUrl2,
                          photo: uploadedFileUrl1,
                          therePhoto:
                              functions.hasUploadedPhoto(uploadedFileUrl1),
                          therePDF: functions.hasUploadedDoc(uploadedFileUrl2),
                        );
                        await PostsRecord.collection.doc().set(postsCreateData);
                        logFirebaseEvent('Button_Navigate-To');

                        context.pushNamed('ProfilePage');
                      },
                      text: 'Create new post',
                      options: FFButtonOptions(
                        width: 170,
                        height: 40,
                        color: Color(0xFF33C283),
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle2Family,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).subtitle2Family),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
