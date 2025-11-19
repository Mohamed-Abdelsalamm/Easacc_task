import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easacc_flutter_task/core/prefs/app_preferences.dart';

import 'set_link_state.dart';

class SetLinkCubit extends Cubit<SetLinkState> {
  SetLinkCubit() : super(SetLinkInitial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController linkController = TextEditingController();

  bool _isAutoValidate = false;
  bool get isAutoValidate => _isAutoValidate;

  void enableAutoValidate() {
    if (!_isAutoValidate) {
      _isAutoValidate = true;
      emit(SetLinkAutoValidate());
    }
  }

  Future<void> saveLink() async {
    enableAutoValidate();

    if (!formKey.currentState!.validate()) return;

    emit(SetLinkLoading());

    final raw = linkController.text.trim();

    var uri = Uri.tryParse(raw);
    String normalized = raw;
    if (uri == null || uri.scheme.isEmpty) {
      normalized = 'https://$raw';
      uri = Uri.tryParse(normalized);
    }

    if (uri == null || uri.host.isEmpty) {
      emit(SetLinkFailure(S.current.pleaseEnterValidUrl));
      return;
    }

    await AppPreference.setHomeLink(normalized);
    emit(SetLinkSaved());
  }

  void reset() {
    linkController.clear();
    _isAutoValidate = false;
    emit(SetLinkInitial());
  }

  @override
  Future<void> close() {
    linkController.dispose();
    return super.close();
  }
}
