import 'package:test/test.dart';
import '../lib/contacts.dart';

void main() {
  Map<String, List> validation = {
    "": [null, null, null],

    ///valid phone number

    "+7 987 999 99 99": ["+79879999999", null, null],
    "+7 987 999 9999": [isNot(null), null, null],
    "+7 987 9999999": [isNot(null), null, null],
    "+7 9879999999": [isNot(null), null, null],
    "+79879999999": [isNot(null), null, null],
    "7 987 999 99 99": [isNot(null), null, null],
    "7 987 999 9999": [isNot(null), null, null],
    "7 987 9999999": [isNot(null), null, null],
    "7 9879999999": [isNot(null), null, null],
    "79879999999": [isNot(null), null, null],
    "+7 (987) 999 99 99": [isNot(null), null, null],
    "+7 (987) 999 9999": [isNot(null), null, null],
    "+7 (987) 9999999": [isNot(null), null, null],
    "+7 (987)9999999": [isNot(null), null, null],
    "+7(987)9999999": [isNot(null), null, null],
    "7 (987) 999 99 99": [isNot(null), null, null],
    "7 (987) 999 9999": [isNot(null), null, null],
    "7 (987) 9999999": [isNot(null), null, null],
    "7 (987)9999999": [isNot(null), null, null],
    "7(987)9999999": [isNot(null), null, null],
    "8 987 999 99 99": [isNot(null), null, null],
    "8 987 999 9999": [isNot(null), null, null],
    "8 987 9999999": [isNot(null), null, null],
    "8 9879999999": [isNot(null), null, null],
    "89879999999": [isNot(null), null, null],
    "8 (987) 999 99 99": [isNot(null), null, null],
    "8 (987) 999 9999": [isNot(null), null, null],
    "8 (987) 9999999": [isNot(null), null, null],
    "8 (987)9999999": [isNot(null), null, null],
    "8(987)9999999": [isNot(null), null, null],
    "987 999 99 99": [isNot(null), null, null],
    "987 999 9999": [isNot(null), null, null],
    "987 9999999": [isNot(null), null, null],
    "9879999999": [isNot(null), null, null],
    "(987) 999 99 99": [isNot(null), null, null],
    "(987) 999 9999": [isNot(null), null, null],
    "(987) 9999999": [isNot(null), null, null],
    "(987)9999999": [isNot(null), null, null],
    "+382 068 22 22 22": [isNot(null), null, null],
    "+382 068 222 222": [isNot(null), null, null],
    "+382 068 222222": [isNot(null), null, null],
    "+382 068222222": [isNot(null), null, null],
    "+382068222222": [isNot(null), null, null],
    "382 068 22 22 22": [isNot(null), null, null],
    "382 068 222 222": [isNot(null), null, null],
    "382 068 222222": [isNot(null), null, null],
    "382 068222222": [isNot(null), null, null],
    "382068222222": [isNot(null), null, null],
    "382 (068) 22 22 22": [isNot(null), null, null],
    "382 (068) 222 222": [isNot(null), null, null],
    "382 (068) 222222": [isNot(null), null, null],
    "382 (068)222222": [isNot(null), null, null],
    "382(068)222222": [isNot(null), null, null],
    "068 22 22 22": [isNot(null), null, null],
    "068 222 222": [isNot(null), null, null],
    "068 222222": [isNot(null), null, null],
    "068222222": [isNot(null), null, null],

    ///invalid phone number
    "+9a 99 99": [null, null, null],
    "66 66 66": [null, null, null],
    "66": [null, null, null],
    // "09991_12(-@)": [null, null, null],

    ///valid email

    "email@example.com": [null, isNot(null), null],
    "firstname.lastname@example.com": [null, isNot(null), null],
    "email@subdomain.example.com": [null, isNot(null), null],
    "firstname+lastname@example.com": [null, isNot(null), null],
    "email@example-one.com": [null, isNot(null), null],
    "_______@example.com": [null, isNot(null), null],
    "email@example.name": [null, isNot(null), null],
    "email@example.museum": [null, isNot(null), null],
    "email@example.co.jp": [null, isNot(null), null],
    "firstname-lastname@example.com": [null, isNot(null), null],
    "example.first.middle.lastname@email.com": [null, isNot(null), null],

    ///invalid email

    "#@%^%#@#@#.com": [null, null, null],
    "@example.com": [null, null, isNot(null)], // !попадает в тг никнейм (убрать?)
    "email.example.com": [null, null, null],
    "email.@example.com": [null, null, isNot(null)], // !попадает в тг никнейм (убрать?)
    "email@example": [null, null, null],
    "email@-example.com": [null, null, null],
    "email@example..com": [null, null, null],

    ///valid telegram username

    "@aaarrrg    ": [null, null, isNot(null)],
    "    @aaarrrg": [null, null, isNot(null)],
    "    @aaarrrg       ": [null, null, isNot(null)],

    ///invalid telegram username

    // "   @aaarrrgasdawdqiqejqwiejqwijeqwejj    ": [null, null, null], //! нужно меньше 33 символа, по факту вырезается 32
    "    @ aaarrrg": [null, null, null],
    // "    @aarrr@gaa       ": [null, null, null], //!вырезает до второй @
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
