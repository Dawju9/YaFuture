/*

// test_github_commit.dart
//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:ayagrubmi/main.dart';
// ignore: depend_on_referenced_packages
//import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
//import 'package:ayagrubmi/modules/send_github_changelog.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  test('should retrieve latest commit data', () async {
    // Arrange
    const githubRepoUrl = 'https://github.com/Dawju9/ayagrubmi.git';

    // Mock HTTP client to return sample commit data
    final mockHttpClient = MockHttpClient();
    when(mockHttpClient.get(Uri.parse('$githubRepoUrl/commits')))
        .thenAnswer((_) async => http.Response(
            json.encode([
              {
                'commit': {
                  'message': 'Commit 1',
                  'author': {'name': 'John Doe'},
                  'date': '2020-01-01T00:00:00Z'
                }
              }
            ]),
            200));

    // Act
    final result = await sendGitHubChangelogToAppData(githubRepoUrl,
        httpClient: mockHttpClient);

    // Assert
    expect(result, [
      {
        'message': 'Commit 1',
        'author': 'John Doe',
        'date': DateTime.parse('2020-01-01T00:00:00Z')
      }
    ]);
  });
}


 */