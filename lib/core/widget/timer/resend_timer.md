# AntiResendTimer

`AntiResendTimer` is a widget that displays a resend timer countdown with the ability to trigger a callback for resending action.

## Properties

|   Name   | Required |       Type        |                               Description                               |
| :------: | :------: | :---------------: | :---------------------------------------------------------------------: |
| onResend |    No    | `void Function()` | A callback function that is called when the resend action is triggered. |
| loading  |    No    |      `bool`       | Determines whether the resend timer should display a loading indicator. |
|  second  |    No    |       `int`       |         The duration in seconds for the resend timer countdown.         |

## Usage

```dart
AntiResendTimer(
  onResend: () {
    // Handle resend action here
  },
  loading: false,
  second: 60,
)
```

In this example, the AntiResendTimer widget is created with an optional onResend callback function that handles the resend action. The loading property is set to false to indicate that the resend timer is not in a loading state. The second property is set to 60 to initialize the countdown duration in seconds.

When the resend timer is active, it displays the remaining time in a countdown format. When the resend timer is inactive, it displays a text widget that triggers the resend action when tapped.
