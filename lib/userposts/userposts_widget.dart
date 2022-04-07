import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_post/create_post_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../post_details/post_details_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class UserpostsWidget extends StatefulWidget {
  const UserpostsWidget({Key key}) : super(key: key);

  @override
  _UserpostsWidgetState createState() => _UserpostsWidgetState();
}

class _UserpostsWidgetState extends State<UserpostsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Hey, ',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  AuthUserStreamWidget(
                    child: Text(
                      valueOrDefault<String>(
                        currentUserDisplayName,
                        'there',
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Here are the latest posts from community',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        elevation: 8,
        child: Icon(
          Icons.create_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color(0x3A000000),
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: StreamBuilder<List<PostsRecord>>(
                stream: queryPostsRecord(
                  queryBuilder: (postsRecord) =>
                      postsRecord.orderBy('post_date', descending: true),
                  limit: 100,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<PostsRecord> socialFeedPostsRecordList = snapshot.data;
                  if (socialFeedPostsRecordList.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/images/emptyPosts@2x.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 400,
                      ),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(socialFeedPostsRecordList.length,
                        (socialFeedIndex) {
                      final socialFeedPostsRecord =
                          socialFeedPostsRecordList[socialFeedIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 8),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              socialFeedPostsRecord.postAuthor),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final userPostUsersRecord = snapshot.data;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x32000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PostDetailsWidget(
                                        userRecord: userPostUsersRecord,
                                        postReference:
                                            socialFeedPostsRecord.reference,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 2, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                1, 1, 1, 1),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  userPostUsersRecord
                                                                      .photoUrl,
                                                                  'https://convertingcolors.com/gradient-73937E.svg',
                                                                ),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  valueOrDefault<
                                                                      String>(
                                                                userPostUsersRecord
                                                                    .photoUrl,
                                                                'https://convertingcolors.com/gradient-73937E.svg' +
                                                                    '$socialFeedIndex',
                                                              ),
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: valueOrDefault<
                                                            String>(
                                                          userPostUsersRecord
                                                              .photoUrl,
                                                          'https://convertingcolors.com/gradient-73937E.svg' +
                                                              '$socialFeedIndex',
                                                        ),
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              userPostUsersRecord
                                                                  .photoUrl,
                                                              'https://convertingcolors.com/gradient-73937E.svg',
                                                            ),
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    userPostUsersRecord
                                                        .displayName,
                                                    'myNickname',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 8, 0),
                                            child: Text(
                                              dateTimeFormat(
                                                  'relative',
                                                  socialFeedPostsRecord
                                                      .postDate),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FlutterFlowMediaDisplay(
                                      path: valueOrDefault<String>(
                                        userPostUsersRecord.photoUrl,
                                        'https://i.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68',
                                      ),
                                      imageBuilder: (path) =>
                                          CachedNetworkImage(
                                        imageUrl: path,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 300,
                                        fit: BoxFit.cover,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 8, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 41,
                                                      height: 41,
                                                      child: Stack(
                                                        children: [
                                                          if (socialFeedPostsRecord
                                                                  .likes
                                                                  .toList()
                                                                  ?.contains(
                                                                      userPostUsersRecord
                                                                          .reference) ??
                                                              true)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0.25),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  final postsUpdateData =
                                                                      {
                                                                    'likes':
                                                                        currentUserDocument
                                                                            ?.likesInfo,
                                                                  };
                                                                  await socialFeedPostsRecord
                                                                      .reference
                                                                      .update(
                                                                          postsUpdateData);
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  size: 25,
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .likes(
                                                                  socialFeedPostsRecord)
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.mode_comment_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    size: 24,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 0, 0, 0),
                                                    child: Text(
                                                      socialFeedPostsRecord
                                                          .numOfComments
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF8B97A2),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 12, 12),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  socialFeedPostsRecord
                                                      .postDescription,
                                                  'Just need to talk about how I have been feeling lately.',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
