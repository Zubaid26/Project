import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://football-data1.p.rapidapi.com/match/statistics/team';
  static const Map<String, String> headers = {
    'X-RapidAPI-Key': '04b11d9166mshf89c83338b74a35p1e85adjsn1fe6606eee51',
    'X-RapidAPI-Host': 'football-data1.p.rapidapi.com',
  };

  static Future<http.Response> getMatchStatistics(String matchId) async {
    final url =
        Uri.parse(baseUrl).replace(queryParameters: {'matchId': matchId});

    final response = await http.get(url, headers: headers);
    return response;
  }
}

class MatchStatisticsScreen extends StatefulWidget {
  @override
  _MatchStatisticsScreenState createState() => _MatchStatisticsScreenState();
}

class _MatchStatisticsScreenState extends State<MatchStatisticsScreen> {
  late Future<Map<String, dynamic>> _matchStatistics = _fetchMatchStatistics();

  Future<Map<String, dynamic>> _fetchMatchStatistics() async {
    try {
      final response = await ApiService.getMatchStatistics('21587');

      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        return parsedJson;
      } else {
        throw Exception('Failed to load match statistics');
      }
    } catch (error) {
      throw Exception('Failed to load match statistics');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Statistics'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _matchStatistics,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Failed to load match statistics');
            } else {
              final statistics = snapshot.data;
              if (statistics == null) {
                return Text('No data available');
              }
              return ListView.builder(
                itemCount: statistics.length,
                itemBuilder: (context, index) {
                  final key = statistics.keys.elementAt(index);
                  final value = statistics[key];
                  return ListTile(
                    title: Text(key),
                    subtitle: Text(value.toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
