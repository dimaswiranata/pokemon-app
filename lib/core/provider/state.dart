import 'package:flutter_riverpod/flutter_riverpod.dart';

// example
final counterProvider = StateProvider<int>((ref) => 0);

// auth
final tokenProvider = StateProvider<String>((ref) => '');

// navigator
final indexNavProvider = StateProvider<int>((ref) => 0);

// reservation
final selectedSectionId = StateProvider<String>((ref) => '');
final selectedSectionView = StateProvider<String>((ref) => '');

// scan
final scanOnbordingShowed = StateProvider<bool>((ref) => false);

// hw-irl
final hwIRLAddShowed = StateProvider<bool>((ref) => false);
final liveOnboardingShowed = StateProvider<bool>((ref) => false);
final liveUserChecked = StateProvider<bool>((ref) => false);

// shout-out
final isShoutOutTooltipShowed = StateProvider<bool>((ref) => false);

// send-gifts
final sendGiftHasCustomBack = StateProvider<bool>((ref) => false);

// find-match
final indexPageSwipperFindMatch = StateProvider<int>((ref) => 0);

// setting profile
final isSettingProfileState = StateProvider<bool>((ref) => false);

// general-scan
enum ScanFromPage { home, hwirl }

final scanFromPageProvider = StateProvider<ScanFromPage>((ref) => ScanFromPage.home);
