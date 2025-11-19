import 'package:easacc_flutter_task/generated/l10n.dart';

class Validator {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _phoneRegExp = RegExp(r'^0\d{10}$');

  /// Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.emailRequired;
    } else if (!_emailRegExp.hasMatch(value)) {
      return S.current.invalidEmail;
    }
    return null;
  }

  /// Name
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.nameRequired;
    }
    return null;
  }

  /// General empty field validator
  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.fieldRequired;
    }
    return null;
  }

  /// Empty validator with label
  static String? emptyValidatorWithLabel({
    required String? value,
    required String fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return "$fieldName ${S.current.shouldNotBeEmpty}";
    }
    return null;
  }

  /// Phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.phoneRequired;
    } else if (!_phoneRegExp.hasMatch(value)) {
      return S.current.invalidPhone;
    }
    return null;
  }

  /// Simple password validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.passwordRequired;
    } else if (value.length < 8) {
      return S.current.passwordTooShort;
    }
    return null;
  }

  /// Simple password validator (for login)
  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.passwordRequired;
    }
    return null;
  }

  /// Strong password validator (for registration)
  /// Returns all issues joined by `\n`
  static String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.passwordRequired;
    }

    final List<String> errors = [];

    if (value.length < 8) {
      errors.add('• ${S.current.passwordTooShort}');
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      errors.add('• ${S.current.passwordMustIncludeUppercase}');
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      errors.add('• ${S.current.passwordMustIncludeLowercase}');
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      errors.add('• ${S.current.passwordMustIncludeNumber}');
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      errors.add('• ${S.current.passwordMustIncludeSpecial}');
    }

    return errors.isEmpty ? null : errors.join('\n');
  }

  /// Address
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.addressRequired;
    }
    return null;
  }

  /// Country
  static String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.countryValidationError;
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.otpIsRequired;
    } else if (value.length < 4) {
      return S.current.otpMustBeFourDigits;
    }
    return null; // Return null if the OTP is valid
  }

  /// Confirm Password
  static String? validateConfirmPassword(
    String? value, {
    required String? originalPassword,
  }) {
    if (value == null || value.isEmpty) {
      return S.current.confirmPasswordRequired;
    } else if (originalPassword != null && value != originalPassword) {
      return S.current.passwordsDoNotMatch;
    }
    return null;
  }

  /// validate Link
  static String? validateLink(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.pleaseEnterUrl;
    }
    return null;
  }
}

/// Optional enum-based password validation (useful if doing more granular checks)
enum PasswordValidationError {
  required,
  tooShort,
  noUppercase,
  noLowercase,
  noDigit,
  noSpecialCharacter,
}

extension PasswordValidationErrorExtension on PasswordValidationError {
  String get message {
    switch (this) {
      case PasswordValidationError.required:
        return S.current.passwordRequired;
      case PasswordValidationError.tooShort:
        return S.current.passwordTooShort;
      case PasswordValidationError.noUppercase:
        return S.current.passwordMustIncludeUppercase;
      case PasswordValidationError.noLowercase:
        return S.current.passwordMustIncludeLowercase;
      case PasswordValidationError.noDigit:
        return S.current.passwordMustIncludeNumber;
      case PasswordValidationError.noSpecialCharacter:
        return S.current.passwordMustIncludeSpecial;
    }
  }
}
