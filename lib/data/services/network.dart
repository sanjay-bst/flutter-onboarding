import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class NetworkService {
  final baseurl = 'tournaments-uat-dot-game-tv-engg.appspot.com';

  Future<Map> fetchTournaments(userId, token) async {
    final queryParams = {
      'profile_user_id': '',
      'user_id': 'S5nua460TONzetIIfIgKkFFiQzv1',
      'token': 'cf2005e4-f328-444f-a551-c47755d7af51',
      'lang': 'en',
      'country': 'IN',
      'client': 'app',
    };
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final uri = Uri.http(
      baseurl,
      'profile/user_info',
      queryParams,
    );

    try {
      final response = await get(
        uri,
        headers: headers,
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {};
    }
  }
}
