import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState.initial());

  Future<void> toggleLanguage(String languageCode) async {
    await AppPreference.setAppLang(languageCode);
    emit(state.copyWith(selectedLanguage: languageCode));
  }
}
 