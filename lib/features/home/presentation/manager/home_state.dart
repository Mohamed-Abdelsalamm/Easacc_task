import 'package:flutter/material.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final String link;
  final bool isPageLoading;

  HomeLoaded({required this.link, this.isPageLoading = true});
}

final class HomeNoLink extends HomeState {}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
