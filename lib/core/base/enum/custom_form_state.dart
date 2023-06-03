enum CustomFormState { NONE, IDLE, EDIT, SELECTED}

extension FormStateEnum on CustomFormState {

  bool get isEditing => this == CustomFormState.EDIT;
  bool get isFirstState => this == CustomFormState.NONE;

}