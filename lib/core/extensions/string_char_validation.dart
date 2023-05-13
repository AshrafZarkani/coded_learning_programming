extension StringValidators on String {
  bool get containsCharOnly =>
      contains(RegExp(r'[A-Z]')) || contains(RegExp(r'[a-z]'));
}
