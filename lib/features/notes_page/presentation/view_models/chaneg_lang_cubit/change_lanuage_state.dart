part of 'change_lanuage_cubit.dart';

@immutable
abstract class ChangeLanuageState {}

class ChangeLanuageInitial extends ChangeLanuageState {}

class LoadingChangeLang extends ChangeLanuageState {}

class UpdatedLanguage extends ChangeLanuageState {}
