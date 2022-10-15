import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _following =
        prefs.getStringList('ff_following')?.map((path) => path.ref).toList() ??
            _following;
    _followerCounts = prefs.getInt('ff_followerCounts') ?? _followerCounts;
    _numOrder = prefs.getInt('ff_numOrder') ?? _numOrder;
    _Followers =
        prefs.getStringList('ff_Followers')?.map((path) => path.ref).toList() ??
            _Followers;
    _followingCount = prefs.getInt('ff_followingCount') ?? _followingCount;
  }

  late SharedPreferences prefs;

  List<DocumentReference> Cart = [];

  List<DocumentReference> _following = [];
  List<DocumentReference> get following => _following;
  set following(List<DocumentReference> _value) {
    _following = _value;
    prefs.setStringList('ff_following', _value.map((x) => x.path).toList());
  }

  void addToFollowing(DocumentReference _value) {
    _following.add(_value);
    prefs.setStringList('ff_following', _following.map((x) => x.path).toList());
  }

  void removeFromFollowing(DocumentReference _value) {
    _following.remove(_value);
    prefs.setStringList('ff_following', _following.map((x) => x.path).toList());
  }

  int _followerCounts = 0;
  int get followerCounts => _followerCounts;
  set followerCounts(int _value) {
    _followerCounts = _value;
    prefs.setInt('ff_followerCounts', _value);
  }

  int _numOrder = 0;
  int get numOrder => _numOrder;
  set numOrder(int _value) {
    _numOrder = _value;
    prefs.setInt('ff_numOrder', _value);
  }

  int notifications = 0;

  List<DocumentReference> notifList = [];

  int numNotification = 0;

  bool showFullList = true;

  List<DocumentReference> _Followers = [];
  List<DocumentReference> get Followers => _Followers;
  set Followers(List<DocumentReference> _value) {
    _Followers = _value;
    prefs.setStringList('ff_Followers', _value.map((x) => x.path).toList());
  }

  void addToFollowers(DocumentReference _value) {
    _Followers.add(_value);
    prefs.setStringList('ff_Followers', _Followers.map((x) => x.path).toList());
  }

  void removeFromFollowers(DocumentReference _value) {
    _Followers.remove(_value);
    prefs.setStringList('ff_Followers', _Followers.map((x) => x.path).toList());
  }

  int _followingCount = 0;
  int get followingCount => _followingCount;
  set followingCount(int _value) {
    _followingCount = _value;
    prefs.setInt('ff_followingCount', _value);
  }

  double cartSum = 0.0;

  bool showListProduct = true;

  String token = '';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
