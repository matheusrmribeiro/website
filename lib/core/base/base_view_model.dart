import 'package:website/core/api/api_client.dart';
import 'package:website/core/base/enum/custom_form_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseViewModel extends ChangeNotifier {
  final api = Modular.get<APIClient>();
  bool isLoading = false;
  String loadingMessage = "";

  /// The current register status
  CustomFormState state = CustomFormState.NONE;

  /// Returns if the register is in the edit state.
  get isEditState => state == CustomFormState.EDIT;

  /// Returns if the register is in the select state.
  get isSelectedState => state == CustomFormState.SELECTED;

  void setIDLEState() {
    state = CustomFormState.IDLE;
    notifyListeners();
  }

  void setEditState() {
    state = CustomFormState.EDIT;
    notifyListeners();
  }

  void setSelectedState() {
    state = CustomFormState.SELECTED;
    notifyListeners();
  }

  void notifyChanges() => notifyListeners();

  void loadingStatus(bool isLoading, {String? message}) {
    this.isLoading = isLoading;
    loadingMessage = (!isLoading || message == null) ? "" : message;
    notifyListeners();
  }

}