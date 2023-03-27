class Contacts {
  final String text;

  Contacts(this.text) {
    getEmail();
  }

  String? _phone;
  String? _email;
  String? _tg;

  get phone => _phone;
  get email => _email;
  get tg => _tg;

  getPhone() {
    RegExp phoneExp = RegExp(r"(\+?\(?\d{1,3}[\d{2,}\.\- \(\)]{8,})");
    RegExpMatch? phoneMatch = phoneExp.firstMatch(text);
    if (phoneMatch != null) {
      _phone = phoneMatch[0]!.replaceAll(RegExp(r"\s"), "");
    }
  }

  getEmail() {
    RegExp emailExp = RegExp(r"(\w+[.\+\-]?)*\w+@(\w+[\.-]){1,}\w+");
    RegExpMatch? emailMatch = emailExp.firstMatch(text);
    if (emailMatch != null) _email = emailMatch[0]!.replaceAll(RegExp(r"\s"), "");
  }

  getTg() {
    RegExp tgExp = RegExp(r"(\B@)\w{4,}(\b[^.@]|$)");
    RegExpMatch? tgMatch = tgExp.firstMatch(text);
    if (tgMatch != null) _tg = tgMatch[0]!.replaceAll(RegExp(r"\s"), "");
  }
}
