import 'package:meetup_xpeho/team.dart';
import 'package:test/test.dart';

void main() {
  test('missions is populated at start', () {
    final provider = TeamProvider();

    expect(provider.missions.length, 4);
  });
}
