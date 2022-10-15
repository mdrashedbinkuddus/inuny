import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GETTokenCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    String? channelName = '',
    int? userType,
    int? expiry,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Token',
      apiUrl:
          'https://inuny.herokuapp.com/rtc/${channelName}/${userType}/uid/${uid}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'expiry': expiry,
      },
      returnBody: true,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.rtcToken''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}
