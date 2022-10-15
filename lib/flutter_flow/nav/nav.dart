import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  InunyPagineFirebaseUser? initialUser;
  InunyPagineFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(InunyPagineFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : SignUpWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SignUpWidget(),
          routes: [
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'SignUp',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(),
            ),
            FFRoute(
              name: 'PasswordReset',
              path: 'passwordReset',
              builder: (context, params) => PasswordResetWidget(),
            ),
            FFRoute(
              name: 'FirstProfile',
              path: 'firstProfile',
              builder: (context, params) => FirstProfileWidget(),
            ),
            FFRoute(
              name: 'ExperienceCurriculum_New',
              path: 'experienceCurriculumNew',
              builder: (context, params) => ExperienceCurriculumNewWidget(),
            ),
            FFRoute(
              name: 'Settings',
              path: 'settings',
              builder: (context, params) => SettingsWidget(),
            ),
            FFRoute(
              name: 'MarketplaceSettings',
              path: 'marketplaceSettings',
              builder: (context, params) => MarketplaceSettingsWidget(),
            ),
            FFRoute(
              name: 'editUserPage',
              path: 'editUserPage',
              builder: (context, params) => EditUserPageWidget(),
            ),
            FFRoute(
              name: 'FirstProfileUniversities',
              path: 'firstProfileUniversities',
              builder: (context, params) => FirstProfileUniversitiesWidget(),
            ),
            FFRoute(
              name: 'AddCurrentEducation',
              path: 'addCurrentEducation',
              builder: (context, params) => AddCurrentEducationWidget(),
            ),
            FFRoute(
              name: 'OnBoarding',
              path: 'onBoarding',
              builder: (context, params) => OnBoardingWidget(),
            ),
            FFRoute(
              name: 'OnBoardingStudents',
              path: 'onBoardingStudents',
              builder: (context, params) => OnBoardingStudentsWidget(),
            ),
            FFRoute(
              name: 'ProfilePageOTHERS',
              path: 'profilePageOTHERS',
              asyncParams: {
                'userDetails': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ProfilePageOTHERSWidget(
                userDetails: params.getParam('userDetails', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ChatSearchUser',
              path: 'chatSearchUser',
              builder: (context, params) => ChatSearchUserWidget(
                searchTerm: params.getParam('searchTerm', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'NewChat',
              path: 'newChat',
              asyncParams: {
                'chat': getDoc('chats', ChatsRecord.serializer),
              },
              builder: (context, params) => NewChatWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, 'chats'),
              ),
            ),
            FFRoute(
              name: 'AllChats',
              path: 'allChats',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'AllChats')
                  : AllChatsWidget(),
            ),
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'HomeSearch',
              path: 'homeSearch',
              builder: (context, params) => HomeSearchWidget(),
            ),
            FFRoute(
              name: 'ProfilePage',
              path: 'profilePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ProfilePage')
                  : ProfilePageWidget(),
            ),
            FFRoute(
              name: 'SinglePost',
              path: 'singlePost',
              asyncParams: {
                'userRef': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => SinglePostWidget(
                postParamenter: params.getParam('postParamenter',
                    ParamType.DocumentReference, false, 'posts'),
                userRef: params.getParam('userRef', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'MarketType',
              path: 'marketType',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MarketType')
                  : MarketTypeWidget(),
            ),
            FFRoute(
              name: 'AddProduct',
              path: 'addProduct',
              asyncParams: {
                'productsnewRef': getDoc('Products', ProductsRecord.serializer),
              },
              builder: (context, params) => AddProductWidget(
                productsnewRef:
                    params.getParam('productsnewRef', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'productDetails',
              path: 'productDetails',
              asyncParams: {
                'productRef': getDoc('Products', ProductsRecord.serializer),
              },
              builder: (context, params) => ProductDetailsWidget(
                productRef: params.getParam('productRef', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'OthersFollowing',
              path: 'othersFollowing',
              builder: (context, params) => OthersFollowingWidget(
                followingRef: params.getParam('followingRef',
                    ParamType.DocumentReference, false, 'users'),
              ),
            ),
            FFRoute(
              name: 'Followers',
              path: 'followers',
              builder: (context, params) => FollowersWidget(
                followersRef: params.getParam('followersRef',
                    ParamType.DocumentReference, false, 'users'),
              ),
            ),
            FFRoute(
              name: 'Myfollowers',
              path: 'myfollowers',
              builder: (context, params) => MyfollowersWidget(),
            ),
            FFRoute(
              name: 'Myfollowing',
              path: 'myfollowing',
              builder: (context, params) => MyfollowingWidget(),
            ),
            FFRoute(
              name: 'cart',
              path: 'cart',
              asyncParams: {
                'productRef': getDoc('Products', ProductsRecord.serializer),
                'userRef': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => CartWidget(
                productRef: params.getParam('productRef', ParamType.Document),
                userRef: params.getParam('userRef', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'searchProduct',
              path: 'searchProduct',
              builder: (context, params) => SearchProductWidget(),
            ),
            FFRoute(
              name: 'ProductReviews',
              path: 'productReviews',
              asyncParams: {
                'productRef': getDoc('Products', ProductsRecord.serializer),
              },
              builder: (context, params) => ProductReviewsWidget(
                productRef: params.getParam('productRef', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'MyArticles',
              path: 'myArticles',
              builder: (context, params) => MyArticlesWidget(),
            ),
            FFRoute(
              name: 'MyOrders',
              path: 'myOrders',
              builder: (context, params) => MyOrdersWidget(),
            ),
            FFRoute(
              name: 'Orders',
              path: 'orders',
              builder: (context, params) => OrdersWidget(),
            ),
            FFRoute(
              name: 'Success',
              path: 'success',
              asyncParams: {
                'productRef': getDoc('Products', ProductsRecord.serializer),
                'userRef': getDoc('users', UsersRecord.serializer),
                'orderRef': getDoc('orderPlaced', OrderPlacedRecord.serializer),
              },
              builder: (context, params) => SuccessWidget(
                productRef: params.getParam('productRef', ParamType.Document),
                userRef: params.getParam('userRef', ParamType.Document),
                orderRef: params.getParam('orderRef', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateStudyRooms',
              path: 'createStudyRooms',
              requireAuth: true,
              builder: (context, params) => CreateStudyRoomsWidget(),
            ),
            FFRoute(
              name: 'StudyRooms',
              path: 'studyRooms',
              builder: (context, params) => StudyRoomsWidget(),
            ),
            FFRoute(
              name: 'SingleRoom',
              path: 'singleRoom',
              requireAuth: true,
              builder: (context, params) => SingleRoomWidget(
                roomRef: params.getParam(
                    'roomRef', ParamType.DocumentReference, false, 'Rooms'),
                organizerRef: params.getParam('organizerRef',
                    ParamType.DocumentReference, false, 'users'),
              ),
            ),
            FFRoute(
              name: 'VideocallsPage',
              path: 'videocallsPage',
              requireAuth: true,
              builder: (context, params) => VideocallsPageWidget(),
            ),
            FFRoute(
              name: 'SearchStudyRooms',
              path: 'searchStudyRooms',
              builder: (context, params) => SearchStudyRoomsWidget(),
            ),
            FFRoute(
              name: 'InviteUsers',
              path: 'inviteUsers',
              builder: (context, params) => InviteUsersWidget(
                roomRef: params.getParam(
                    'roomRef', ParamType.DocumentReference, false, 'Rooms'),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/signUp';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  child: Image.asset(
                    'assets/images/Aggiungi_corpo_del_testo-8.png',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
