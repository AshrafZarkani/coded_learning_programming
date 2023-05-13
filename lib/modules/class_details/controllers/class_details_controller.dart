import 'package:flutter/foundation.dart';
import 'package:learn_programming/modules/class_details/data/models/interaction_options_class.dart';
import 'package:uuid/uuid.dart';

class ClassDetailsController extends ChangeNotifier {
  String _originalQuestionString = "";
  Set<String> substr = {};
  Set<String> replacement = {};
  String _newQuestionString = "";
  String _cacheString = "";
  bool _isFavorite = false;

  var uuid = const Uuid().v1();

  String get originalQuestionString => _originalQuestionString;
  String get newQuestionString => _newQuestionString;
  String get cacheString => _cacheString;
  bool get isFavorite => _isFavorite;

  /// add the answer optiones recieved from backend to a list
  void setOfAnswerOptions(List<InteractionOptions> interactionOptions) {
    for (var element in interactionOptions) {
      substr.add(element.text.text);
    }
  }

  /// new custom string with answer options hidden
  String newQuestionWithoutInteractionText(String val) {
    _originalQuestionString = val;
    String newQuestionWithoutInteractionString = val;
    for (var element in substr) {
      newQuestionWithoutInteractionString =
          newQuestionWithoutInteractionString.replaceAll(element, uuid);
    }
    _newQuestionString = newQuestionWithoutInteractionString;
    return newQuestionWithoutInteractionString;
  }

  /// get user answer option
  void selectAnswerOption(String value) {
    replacement.add(value);
    newUserAnswerInteractionText(value);
  }

  /// removes option value from previusly selected
  void removeUserAnsweredOption() {
    newUserAnswerInteractionText(replacement.last, removeItem: true);
    replacement.remove(replacement.last);
  }

  /// reset all user answers
  void removeAllUserAnswers() {
    replacement.clear();
    notifyListeners();
  }

  /// new custom string with answer options hidden
  void newUserAnswerInteractionText(String value, {bool? removeItem}) {
    if (removeItem == true) {
      /// if removing from the string using back button last option delete
      for (var element in replacement) {
        if (element != value) {
          _newQuestionString = _newQuestionString.replaceFirst(uuid, element);
        }
      }
    } else {
      /// if adding to the new string with user option selected
      for (var element in replacement) {
        _newQuestionString = _newQuestionString.replaceFirst(uuid, element);
      }
    }
    _cacheString = _newQuestionString;
    notifyListeners();
  }

  bool checkAnsweredStringValidity() {
    if (_cacheString == _originalQuestionString) {
      return true;
    } else {
      return false;
    }
  }

  void toggle() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}
