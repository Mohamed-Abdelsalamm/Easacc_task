part of 'language_cubit.dart';

class LanguageState {
  final String selectedLanguage;
  final bool isDropdownOpen;

  const LanguageState({
    required this.selectedLanguage,
    required this.isDropdownOpen,
  });

  factory LanguageState.initial() => LanguageState(
    selectedLanguage: AppPreference.getAppLang() ?? "ar",
    isDropdownOpen: false,
  );

  LanguageState copyWith({String? selectedLanguage, bool? isDropdownOpen}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      isDropdownOpen: isDropdownOpen ?? this.isDropdownOpen,
    );
  }
}
