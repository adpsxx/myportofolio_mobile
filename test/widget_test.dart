import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';

void main() {
  test('Project can be created from JSON', () {
    final project = Project.fromJson(<String, dynamic>{
      'id': '1',
      'title': 'Portfolio',
      'description': 'My personal portfolio',
      'thumbnail': '',
      'project_link': 'https://example.com',
    });

    expect(project.title, 'Portfolio');
    expect(project.projectLink, 'https://example.com');
    expect(project.toJson().containsKey('id'), isFalse);
  });
}
