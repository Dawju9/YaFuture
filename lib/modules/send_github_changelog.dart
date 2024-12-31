import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<void> sendGitHubChangelogToDiscord(
    String githubRepoUrl, String webhookUrl) async {
  try {
    // Pobranie listy commitów z repozytorium GitHuba
    final response = await http.get(Uri.parse('$githubRepoUrl/commits'));

    // Sprawdzenie, czy pobranie danych zakończyło się sukcesem
    if (response.statusCode != 200) {
      throw HttpException(
        'Wystąpił błąd podczas pobierania danych z repozytorium GitHuba. '
        'Kod błędu: ${response.statusCode}',
        uri: Uri.parse('$githubRepoUrl/commits'),
      );
    }

    final List<dynamic> commits = json.decode(response.body);

    // Przygotowanie wiadomości changelogu
    final changelog = StringBuffer('Changelog:\n');
    for (final commit in commits) {
      final commitMessage = commit['commit']['message'];
      final commitAuthor = commit['commit']['author']['name'];
      final commitDate = commit['commit']['author']['date'];

      changelog.write('$commitDate - $commitAuthor: $commitMessage\n');
    }

    // Wysłanie changelogu na kanał Discord za pomocą webhooka
    final data = {
      'content': changelog.toString(),
    };

    final jsonData = json.encode(data);
    await http.post(
      Uri.parse(webhookUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );
  } on Exception catch (e, stackTrace) {
    FlutterError.reportError(FlutterErrorDetails(
      exception: e,
      stack: stackTrace,
      library: 'sendGitHubChangelogToDiscord function',
      context: ErrorDescription('during sending changelog to Discord'),
    ));
  }
}

class HttpException implements Exception {
  final String message;
  final Uri uri;

  HttpException(this.message, {required this.uri});

  @override
  String toString() => '$message ($uri)';
}
