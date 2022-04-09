import 'package:AnimeTare/model/complete_model.dart';
import 'package:AnimeTare/model/detail_model.dart';
import 'package:AnimeTare/model/genre_model.dart';
import 'package:AnimeTare/model/home_model.dart';
import 'package:AnimeTare/model/ongoing_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String _baseUrl = "https://otakudesu.farindev.my.id/api/";

  Future<Home>? homePageApi() async {
    final response = await http.get(Uri.parse(_baseUrl + "home"));

    if (response.statusCode == 200) {
      return Home.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal Memuat Data");
    }
  }

  Future<Genre>? genreApi() async {
    final response = await http.get(Uri.parse(_baseUrl + "genres"));

    if (response.statusCode == 200) {
      return Genre.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal Memuat Data");
    }
  }

  Future<Ongoing>? ongoingApi(int page) async {
    final response =
        await http.get(Uri.parse(_baseUrl + "ongoing/page/" + page.toString()));

    if (response.statusCode == 200) {
      return Ongoing.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal Memuat Data");
    }
  }

  Future<CompleteResult>? completeApi(int page) async {
    final response = await http
        .get(Uri.parse(_baseUrl + "complete/page/" + page.toString()));

    if (response.statusCode == 200) {
      return CompleteResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal Memuat Data");
    }
  }

  Future<DetailAnime> detailAnimeApi(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + "anime/" + id));

    if (response.statusCode == 200) {
      return DetailAnime.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal Memuat Data");
    }
  }
}
