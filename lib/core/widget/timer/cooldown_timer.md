# AntiCooldownTimer

`AntiCooldownTimer` is a widget that displays a countdown timer with customizable duration and text style.

## Properties

|        Name         | Required |      Type      |                    Description                    |
| :-----------------: | :------: | :------------: | :-----------------------------------------------: |
|  countdownDuration  |   Yes    |   `Duration`   |       The duration of the countdown timer.        |
| onCountdownComplete |    No    | `VoidCallback` | A callback function when the countdown completes. |
|      textStyle      |    No    |  `TextStyle?`  |      The text style for the countdown timer.      |

## Usage

```dart
AntiCooldownTimer(
  countdownDuration: Duration(minutes: 5),
  onCountdownComplete: () {
    // Handle countdown completion
  },
  textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  ),
)
```

In this example, the AntiCooldownTimer widget is created with a countdownDuration of 5 minutes. When the countdown is complete, the onCountdownComplete callback function is invoked. The countdown timer is displayed using the provided textStyle.

Don't forget to import necessary dependencies like dart:async and package:flutter/material.dart in your project for the AntiCooldownTimer widget to work.
