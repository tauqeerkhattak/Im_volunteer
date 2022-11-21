import 'package:get_it/get_it.dart';

import 'auth_service.dart';
import 'chat_service.dart';
import 'firestore_service.dart';
import 'messaging_service.dart';

final locator = GetIt.instance;

void init() {
  locator.registerSingleton<MessagingService>(MessagingService());
  locator.registerSingleton<FirestoreService>(FirestoreService());
  locator.registerSingleton<ChatService>(ChatService());
  locator.registerSingleton<AuthService>(AuthService());
}
