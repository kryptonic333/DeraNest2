import 'package:deranest/features/authentication/data/auth_provider/auth_provider.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStreamProvider = StreamProvider<UserModel?>((ref) {
  final auth = ref.watch(authProvider.notifier);
  final userId = auth.currentUserId;
  if (userId == null) return Stream.value(null);
  return ref.read(firestoreServiceProvider).streamUserData(userId.toString());
});
