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

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `You Don't Have Any Notes`
  String get you_dont_have_any_notes {
    return Intl.message(
      'You Don\'t Have Any Notes',
      name: 'you_dont_have_any_notes',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get add_note {
    return Intl.message(
      'Add Note',
      name: 'add_note',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get content {
    return Intl.message(
      'Content',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Edit Note`
  String get edit_note {
    return Intl.message(
      'Edit Note',
      name: 'edit_note',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all notes?`
  String get areYouSureDeleteAllNotes {
    return Intl.message(
      'Are you sure you want to delete all notes?',
      name: 'areYouSureDeleteAllNotes',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete Note?`
  String get areYouSureDeleteNote {
    return Intl.message(
      'Are you sure you want to delete Note?',
      name: 'areYouSureDeleteNote',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to Change Lang?`
  String get areYouSureChangeLang {
    return Intl.message(
      'Are you sure you want to Change Lang?',
      name: 'areYouSureChangeLang',
      desc: '',
      args: [],
    );
  }

  /// `Delete All Notes`
  String get deleteAllNotes {
    return Intl.message(
      'Delete All Notes',
      name: 'deleteAllNotes',
      desc: '',
      args: [],
    );
  }

  /// `All Notes Deleted Successfully`
  String get successDeleted {
    return Intl.message(
      'All Notes Deleted Successfully',
      name: 'successDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Something Error occurred`
  String get somethingError {
    return Intl.message(
      'Something Error occurred',
      name: 'somethingError',
      desc: '',
      args: [],
    );
  }

  /// `Successfully`
  String get AddedSucccess {
    return Intl.message(
      'Successfully',
      name: 'AddedSucccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `عربي`
  String get lang {
    return Intl.message(
      'عربي',
      name: 'lang',
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
