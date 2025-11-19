import 'package:flutter/material.dart';

@immutable
sealed class SetLinkState {}

final class SetLinkInitial extends SetLinkState {}

final class SetLinkLoading extends SetLinkState {}

final class SetLinkSaved extends SetLinkState {
  SetLinkSaved();
}

final class SetLinkFailure extends SetLinkState {
  final String errorMessage;
  SetLinkFailure(this.errorMessage);
}

final class SetLinkAutoValidate extends SetLinkState {
  SetLinkAutoValidate();
}
