enum TierLevel { Level1, Level2, Level3, SPECIAL }

extension TierLevelExt on TierLevel {
  String get shadow {
    switch (this) {
      case TierLevel.SPECIAL:
        return 'assets/images/profile_shadow_platinum.png';
      case TierLevel.Level1:
        return 'assets/images/profile_shadow_basic.png';
      case TierLevel.Level2:
        return 'assets/images/profile_shadow_silver.png';
      case TierLevel.Level3:
        return 'assets/images/profile_shadow_gold.png';
    }
  }

  String get progressIndicator {
    switch (this) {
      case TierLevel.SPECIAL:
        return 'assets/images/profile_platinum_indicator.png';
      case TierLevel.Level1:
        return 'assets/images/profile_basic_indicator.png';
      case TierLevel.Level2:
        return 'assets/images/profile_silver_indicator.png';
      case TierLevel.Level3:
        return 'assets/images/profile_gold_indicator.png';
    }
  }

  String get title {
    switch (this) {
      case TierLevel.SPECIAL:
        return 'Platinum';
      case TierLevel.Level1:
        return 'Basic';
      case TierLevel.Level2:
        return 'Silver';
      case TierLevel.Level3:
        return 'Gold';
    }
  }

  String get capsule {
    switch (this) {
      case TierLevel.SPECIAL:
        return 'assets/images/membership_platinum_capsule.png';
      case TierLevel.Level1:
        return 'assets/images/membership_basic_capsule.png';
      case TierLevel.Level2:
        return 'assets/images/membership_silver_capsule.png';
      case TierLevel.Level3:
        return 'assets/images/membership_gold_capsule.png';
    }
  }
}
