class AuthState {
  bool isAuthorized;
  String? surName;
  String? givenName;
  String? phoneNumber;

  AuthState({
    required this.isAuthorized,
    required this.surName,
    required this.givenName,
    required this.phoneNumber,
  });

  AuthState.unauthorized()
    : this(
        isAuthorized: false,
        surName: null,
        givenName: null,
        phoneNumber: null,
      );
}
