import 'contacts.dart';

void main() {
  final contacts = Contacts("@aaarrrgasdawdqiqejqwiejqwijeqwejj");
  contacts.getPhone();
  contacts.getEmail();
  contacts.getTg();

  final String? phone = contacts.phone;
  final String? email = contacts.email;
  final String? tg = contacts.tg;

  print(phone);
  print(email);
  print(tg);
}
