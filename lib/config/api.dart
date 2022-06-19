import 'dart:convert';

import 'package:flutter_takeaseat/models/station.dart';
import 'package:flutter_takeaseat/models/user.dart';
import 'package:http/http.dart' as http;

class takeASeatAPI {
  final Uri host;
  const takeASeatAPI(this.host);

  Uri uriFor(String path) => host.replace(path: path);

  Future<List<Station>> getStations() async {
    final data = await http.get(
      uriFor('/api/station/getStations'),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final result = jsonDecode(data.body);
    if (result['error']) {
      throw Exception(result['message']);
    }
    return (result["message"] as List<dynamic>)
        .map((e) => Station.fromJson(e))
        .toList();
  }

  Future<Station> getStation(String stationId) async {
    final data = await http.get(
      uriFor('/api/station/getStation/' + stationId),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final result = jsonDecode(data.body);
    if (result['error']) {
      throw Exception(result['message']);
    }
    return Station.fromJson(result['message']);
  }

  Future<String> loginUser(String email, String password) async {
    final payload = {
      "email": email,
      "password": password,
    };
    final data = await http.post(
      uriFor('/api/auth'),
      body: json.encode(payload),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final result = jsonDecode(data.body);
    if (result['error']) {
      throw Exception(result['message']);
    }
    return result['message'];
  }

  Future<String> registerUser(
      String name, String email, String password) async {
    final payload = {
      "email": email,
      "password": password,
      "name": name,
    };
    final data = await http.post(
      uriFor('/api/auth/create'),
      body: json.encode(payload),
      headers: {
        "Content-Type": "application/json",
      },
    );
    final result = jsonDecode(data.body);
    if (result['error']) {
      throw Exception(result['message']);
    }
    return result['message'];
  }

  Future<User> getUser(String token) async {
    final data = await http.get(
      uriFor('/api/user'),
      headers: {
        "Content-Type": "application/json",
        "x-auth-token": token,
      },
    );
    final result = jsonDecode(data.body);
    if (result['error']) {
      throw Exception(result['message']);
    }
    return User.fromJson(result['message']);
  }
}
