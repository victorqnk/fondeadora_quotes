import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora/controllers/user.dart';

void main() {
  group('UserController', () {
    //  init instance
    var user = UserController();
    // initial state
    test('value should start false', () {
      // check output
      expect(user.logged, false);
    });
    // execute login action
    test('value should be true after login', () {
      user.login(email: 'test@email.com', password: 'test123');
      // check output
      expect(user.logged, true);
    });
    // execute logout action
    test('value should be false after logout', () {
      user.logout();
      // check output
      expect(user.logged, false);
    });
  });
}
