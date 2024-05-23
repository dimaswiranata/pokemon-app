# AntiOtp

`AntiOtp` is a widget that provides an input field for OTP (One-Time Password) with error handling and validation capabilities.

## Properties

|     Name      | Required |            Type             |                         Description                         |
| :-----------: | :------: | :-------------------------: | :---------------------------------------------------------: |
| otpController |   Yes    |   `TextEditingController`   |           The controller for the OTP input field.           |
|  onValidator  |    No    | `String? Function(String?)` |  The function to validate the entered OTP before API hit.   |
|   onFullfil   |    No    |      `void Function()`      |  The function triggered when the OTP is completely filled.  |
|   errorText   |    No    |          `String?`          |       The error text to display below the OTP field.        |
| onResetError  |    No    |      `void Function()`      | The function triggered to reset the error state of the OTP. |

## Usage

```dart
AntiOtp(
  otpController: TextEditingController(),
  onValidator: (value) {
    // Perform custom validation logic here
    // and return an error message if necessary
    if (value!.length < otpLength) {
      return 'Invalid OTP';
    }
    return null;
  },
  onFullfil: () {
    // Perform action when OTP is fully entered
  },
  onResetError: () {
    // Reset the error state of the OTP field
  },
  errorText: 'Invalid OTP',
)
```

In this example, the AntiOtp widget is created with a required otpController for managing the OTP input field. The onValidator callback is used to perform custom validation logic on the entered OTP. If the validation fails, the callback should return an error message. The onFullfil callback is triggered when the OTP is fully entered and validated. The onResetError callback is used to reset the error state of the OTP field. The errorText property is used to display a pre-defined error message below the OTP field.
