import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_app/core/index.dart';

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier() : super(Profile(fullname: 'Jennifer Lesmana', phoneNumber: '+6281234567890', email: 'jlesmana@gmail.com'));

  void setProfile(Profile profile) {
    state = profile;
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, Profile>((ref) => ProfileNotifier());
