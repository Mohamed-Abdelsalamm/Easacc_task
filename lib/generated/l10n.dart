// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Connection timeout with ApiServer`
  String get connectionTimeout {
    return Intl.message(
      'Connection timeout with ApiServer',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with ApiServer`
  String get sendTimeout {
    return Intl.message(
      'Send timeout with ApiServer',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with ApiServer`
  String get receiveTimeout {
    return Intl.message(
      'Receive timeout with ApiServer',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request to ApiServer was canceled`
  String get requestCanceled {
    return Intl.message(
      'Request to ApiServer was canceled',
      name: 'requestCanceled',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error, Please try again!`
  String get unexpectedError {
    return Intl.message(
      'Unexpected Error, Please try again!',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Oops, There was an Error, Please try again`
  String get generalError {
    return Intl.message(
      'Oops, There was an Error, Please try again',
      name: 'generalError',
      desc: '',
      args: [],
    );
  }

  /// `Your request not found, Please try later!`
  String get requestNotFound {
    return Intl.message(
      'Your request not found, Please try later!',
      name: 'requestNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server error, Please try later`
  String get internalServerError {
    return Intl.message(
      'Internal Server error, Please try later',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back to Easacc, enter your account and get your POS system running`
  String get loginSubtitle {
    return Intl.message(
      'Welcome back to Easacc, enter your account and get your POS system running',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email`
  String get emailValidationError {
    return Intl.message(
      'Please enter email',
      name: 'emailValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get passwordValidationError {
    return Intl.message(
      'Please enter password',
      name: 'passwordValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccountPrompt {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccountPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Create your account now`
  String get createAccountLink {
    return Intl.message(
      'Create your account now',
      name: 'createAccountLink',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `By logging in, you agree to our`
  String get termsAgreementPart1 {
    return Intl.message(
      'By logging in, you agree to our',
      name: 'termsAgreementPart1',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get termsAgreementPart2 {
    return Intl.message(
      'and',
      name: 'termsAgreementPart2',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// ` of us.`
  String get termsAgreementPart3 {
    return Intl.message(
      ' of us.',
      name: 'termsAgreementPart3',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get invalidEmailOrPassword {
    return Intl.message(
      'Invalid email or password',
      name: 'invalidEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login failed, please try again`
  String get loginFailed {
    return Intl.message(
      'Login failed, please try again',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get invalidPhone {
    return Intl.message(
      'Enter a valid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Should not be empty`
  String get shouldNotBeEmpty {
    return Intl.message(
      'Should not be empty',
      name: 'shouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Address is required`
  String get addressRequired {
    return Intl.message(
      'Address is required',
      name: 'addressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must include at least one uppercase letter`
  String get passwordMustIncludeUppercase {
    return Intl.message(
      'Password must include at least one uppercase letter',
      name: 'passwordMustIncludeUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must include at least one lowercase letter`
  String get passwordMustIncludeLowercase {
    return Intl.message(
      'Password must include at least one lowercase letter',
      name: 'passwordMustIncludeLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must include at least one number`
  String get passwordMustIncludeNumber {
    return Intl.message(
      'Password must include at least one number',
      name: 'passwordMustIncludeNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must include at least one special character`
  String get passwordMustIncludeSpecial {
    return Intl.message(
      'Password must include at least one special character',
      name: 'passwordMustIncludeSpecial',
      desc: '',
      args: [],
    );
  }

  /// `OTP is required`
  String get otpIsRequired {
    return Intl.message(
      'OTP is required',
      name: 'otpIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP must be 4 digits`
  String get otpMustBeFourDigits {
    return Intl.message(
      'OTP must be 4 digits',
      name: 'otpMustBeFourDigits',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm Password is required',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your country`
  String get countryValidationError {
    return Intl.message(
      'Please enter your country',
      name: 'countryValidationError',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Set Link`
  String get setLink {
    return Intl.message(
      'Set Link',
      name: 'setLink',
      desc: '',
      args: [],
    );
  }

  /// `No link configured.`
  String get noLinkConfigured {
    return Intl.message(
      'No link configured.',
      name: 'noLinkConfigured',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a link.`
  String get pleaseEnterUrl {
    return Intl.message(
      'Please enter a link.',
      name: 'pleaseEnterUrl',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the link to proceed.`
  String get enterLinkPrompt {
    return Intl.message(
      'Please enter the link to proceed.',
      name: 'enterLinkPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Link saved successfully.`
  String get linkSavedSuccessfully {
    return Intl.message(
      'Link saved successfully.',
      name: 'linkSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid URL.`
  String get pleaseEnterValidUrl {
    return Intl.message(
      'Please enter a valid URL.',
      name: 'pleaseEnterValidUrl',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Available Network Devices`
  String get availableNetworkDevices {
    return Intl.message(
      'Available Network Devices',
      name: 'availableNetworkDevices',
      desc: '',
      args: [],
    );
  }

  /// `Selected ID`
  String get selectedId {
    return Intl.message(
      'Selected ID',
      name: 'selectedId',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Permissions Required`
  String get permissionsRequired {
    return Intl.message(
      'Permissions Required',
      name: 'permissionsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please grant the required permissions:\n• Enable Location Service (required for Bluetooth scanning)\n• Enable Bluetooth Service\n\nTap "Refresh Devices" to try again.`
  String get permissionsRequiredMessage {
    return Intl.message(
      'Please grant the required permissions:\n• Enable Location Service (required for Bluetooth scanning)\n• Enable Bluetooth Service\n\nTap "Refresh Devices" to try again.',
      name: 'permissionsRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `No devices found.`
  String get noDevicesFound {
    return Intl.message(
      'No devices found.',
      name: 'noDevicesFound',
      desc: '',
      args: [],
    );
  }

  /// `Please check:\n• Bluetooth is turned ON\n• Location services are enabled\n• Devices are nearby and powered on\n• Wi-Fi printers are on the same network\n\nTap "Refresh Devices" to scan again.`
  String get noDevicesFoundMessage {
    return Intl.message(
      'Please check:\n• Bluetooth is turned ON\n• Location services are enabled\n• Devices are nearby and powered on\n• Wi-Fi printers are on the same network\n\nTap "Refresh Devices" to scan again.',
      name: 'noDevicesFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to discover devices`
  String get failedToDiscoverDevices {
    return Intl.message(
      'Failed to discover devices',
      name: 'failedToDiscoverDevices',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
