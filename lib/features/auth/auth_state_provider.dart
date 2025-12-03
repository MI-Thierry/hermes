import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_state.dart';

class AuthStateProvider extends ChangeNotifier {
  final _surnameKey = 'sur-name';
  final _givenNameKey = 'given-name';
  final _phoneNumberKey = 'phone-number';
  final _expireDateKey = 'expire-date';
  final _storage = FlutterSecureStorage();

  Future<AuthState> getAuthenticationState() async {
    var expireDateStr = await _storage.read(key: _expireDateKey);
    var expireDate = DateTime.tryParse(expireDateStr ?? '');
    if (expireDate != null && DateTime.now().isBefore(expireDate)) {
      return AuthState(
        isAuthorized: true,
        surName: await _storage.read(key: _surnameKey),
        givenName: await _storage.read(key: _givenNameKey),
        phoneNumber: await _storage.read(key: _phoneNumberKey),
      );
    }
    return AuthState.unauthorized();
  }

  Future updateAuthenticationState({
    required String surname,
    required String givenName,
    required String phoneNumber,
  }) async {
    await _storage.write(
      key: _expireDateKey,
      value: DateTime.now().add(Duration(hours: 1)).toString(),
    );
    await _storage.write(key: _surnameKey, value: surname);
    await _storage.write(key: _givenNameKey, value: givenName);
    await _storage.write(key: _phoneNumberKey, value: phoneNumber);
    notifyListeners();
  }
}
