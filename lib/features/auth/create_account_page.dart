import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_state_provider.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateAccountPageState();
  }
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _emailController = TextEditingController();
  final _givenNameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  final _validEmailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final _strongPasswordRegex =
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\(\)!\%*?&]).{8,}$";
  final _validPhoneRegex =
      r"^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$";
  final _formKey = GlobalKey<FormState>();
  final InputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    var authStateProvider = Provider.of<AuthStateProvider>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/create_account_page_background.png'),
            alignment: AlignmentGeometry.topCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 160),
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Create Account',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 50),
                  ),
                  Image.asset('assets/logo.png', height: 100, width: 100),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          controller: _surnameController,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            label: const Text('First Name'),
                            border: _border,
                          ),
                        ),

                        TextFormField(
                          controller: _givenNameController,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            label: const Text('Last Name'),
                            border: _border,
                          ),
                        ),

                        TextFormField(
                          controller: _emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter you email';
                            } else if (!RegExp(
                              _validEmailRegex,
                            ).hasMatch(email)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            border: _border,
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter you password';
                            } else if (!RegExp(
                              _strongPasswordRegex,
                            ).hasMatch(password)) {
                              return 'Please use strong password.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            border: _border,
                          ),
                        ),
                        TextFormField(
                          controller: _phoneNumberController,
                          validator: (phone) {
                            if (phone == null || phone.isEmpty) {
                              return 'Please enter you phone number.';
                            } else if (RegExp(
                              _validPhoneRegex,
                            ).hasMatch(phone)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            label: const Text('Phone Number'),
                            border: _border,
                          ),
                        ),
                        SizedBox(height: 40),
                        FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await authStateProvider.updateAuthenticationState(
                                surname: _surnameController.text,
                                givenName: _givenNameController.text,
                                phoneNumber: _phoneNumberController.text,
                              );
                              if (context.mounted) {
                                context.go('/welcome');
                              }
                            }
                          },

                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16),
                            ),
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          child: const Text('Done'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16),
                            ),
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
