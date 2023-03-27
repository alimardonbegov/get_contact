import 'package:test/test.dart';
import '../lib/contacts.dart';

void main() {
  Map<String, List> validation = {
    "": [null, null, null],

    ///valid phone number

    "+7 987 999 99 99": ["+79879999999", null, null],
    "+7 987 999 9999": ["+79879999999", null, null],
    "+7 987 9999999": ["+79879999999", null, null],
    "+7 9879999999": ["+79879999999", null, null],
    "+79879999999": ["+79879999999", null, null],
    "7 987 999 99 99": ["79879999999", null, null],
    "7 987 999 9999": ["79879999999", null, null],
    "7 987 9999999": ["79879999999", null, null],
    "7 9879999999": ["79879999999", null, null],
    "79879999999": ["79879999999", null, null],
    "+7 (987) 999 99 99": ["+7(987)9999999", null, null],
    "+7 (987) 999 9999": ["+7(987)9999999", null, null],
    "+7 (987) 9999999": ["+7(987)9999999", null, null],
    "+7 (987)9999999": ["+7(987)9999999", null, null],
    "+7(987)9999999": ["+7(987)9999999", null, null],
    "7 (987) 999 99 99": ["7(987)9999999", null, null],
    "7 (987) 999 9999": ["7(987)9999999", null, null],
    "7 (987) 9999999": ["7(987)9999999", null, null],
    "7 (987)9999999": ["7(987)9999999", null, null],
    "7(987)9999999": ["7(987)9999999", null, null],
    "8 987 999 99 99": ["89879999999", null, null],
    "8 987 999 9999": ["89879999999", null, null],
    "8 987 9999999": ["89879999999", null, null],
    "8 9879999999": ["89879999999", null, null],
    "89879999999": ["89879999999", null, null],
    "8 (987) 999 99 99": ["8(987)9999999", null, null],
    "8 (987) 999 9999": ["8(987)9999999", null, null],
    "8 (987) 9999999": ["8(987)9999999", null, null],
    "8 (987)9999999": ["8(987)9999999", null, null],
    "8(987)9999999": ["8(987)9999999", null, null],
    "987 999 99 99": ["9879999999", null, null],
    "987 999 9999": ["9879999999", null, null],
    "987 9999999": ["9879999999", null, null],
    "9879999999": ["9879999999", null, null],
    "(987) 999 99 99": ["(987)9999999", null, null],
    "(987) 999 9999": ["(987)9999999", null, null],
    "(987) 9999999": ["(987)9999999", null, null],
    "(987)9999999": ["(987)9999999", null, null],
    "+382 068 22 22 22": ["+382068222222", null, null],
    "+382 068 222 222": ["+382068222222", null, null],
    "+382 068 222222": ["+382068222222", null, null],
    "+382 068222222": ["+382068222222", null, null],
    "+382068222222": ["+382068222222", null, null],
    "382 068 22 22 22": ["382068222222", null, null],
    "382 068 222 222": ["382068222222", null, null],
    "382 068 222222": ["382068222222", null, null],
    "382 068222222": ["382068222222", null, null],
    "382068222222": ["382068222222", null, null],
    "382 (068) 22 22 22": ["382(068)222222", null, null],
    "382 (068) 222 222": ["382(068)222222", null, null],
    "382 (068) 222222": ["382(068)222222", null, null],
    "382 (068)222222": ["382(068)222222", null, null],
    "382(068)222222": ["382(068)222222", null, null],
    "068 22 22 22": ["068222222", null, null],
    "068 222 222": ["068222222", null, null],
    "068 222222": ["068222222", null, null],
    "068222222": ["068222222", null, null],

    ///invalid phone number
    "+9a 99 99": [null, null, null],
    "66 66 66": [null, null, null],
    "66": [null, null, null],
    // "09991_12(-@)": [null, null, null],

    ///valid email

    "email@example.com": [null, "email@example.com", null],
    "firstname.lastname@example.com": [null, "firstname.lastname@example.com", null],
    "email@subdomain.example.com": [null, "email@subdomain.example.com", null],
    "firstname+lastname@example.com": [null, "firstname+lastname@example.com", null],
    "email@example-one.com": [null, "email@example-one.com", null],
    "_______@example.com": [null, "_______@example.com", null],
    "email@example.name": [null, "email@example.name", null],
    "email@example.museum": [null, "email@example.museum", null],
    "email@example.co.jp": [null, "email@example.co.jp", null],
    "firstname-lastname@example.com": [null, "firstname-lastname@example.com", null],
    "example.first.middle.lastname@email.com": [null, "example.first.middle.lastname@email.com", null],

    ///invalid email

    "#@%^%#@#@#.com": [null, null, null],
    "@example.com": [null, null, null],
    "email.example.com": [null, null, null],
    "email.@example.com": [null, null, null],
    "email@example": [null, null, null],
    "email@-example.com": [null, null, null],
    "email@example..com": [null, null, null],

    ///valid telegram username

    "@aaarrrg    ": [null, null, "@aaarrrg"],
    "    @aaarrrg": [null, null, "@aaarrrg"],
    "    @aaarrrg       ": [null, null, "@aaarrrg"],

    ///invalid telegram username

    "    @ aaarrrg": [null, null, null],
    "    @aarrr@gaa       ": [null, null, null],
  };

  test('Field epmty returns null', () {
    validation.entries.forEach((e) {
      final contacts = Contacts(e.key)
        ..getPhone()
        ..getEmail()
        ..getTg();
      expect(contacts.phone, e.value[0]);
      expect(contacts.email, e.value[1]);
      expect(contacts.tg, e.value[2]);
    });
  });
}
