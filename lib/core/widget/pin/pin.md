# AntiPin

`AntiPin` is a widget that provides an input field for a PIN (Personal Identification Number) with error handling and validation capabilities.

## Properties

|     Name      | Required |             Type             |                         Description                         |
| :-----------: | :------: | :--------------------------: | :---------------------------------------------------------: |
| pinController |   Yes    |   `TextEditingController`    |           The controller for the PIN input field.           |
|  onValidator  |    No    | `dynamic Function(dynamic)?` |  The function to validate the entered PIN before API hit.   |
|   onFullfil   |    No    |      `void Function()`       |  The function triggered when the PIN is completely filled.  |
| onResetError  |    No    |      `void Function()`       | The function triggered to reset the error state of the PIN. |
|   errorText   |    No    |          `String?`           |                 The error text to display.                  |
|   focusNode   |   Yes    |         `FocusNode`          |              The focus node for the PIN input.              |

## Usage

```dart
AntiPin(
  pinController: TextEditingController(),
  onValidator: (value) {
    // Perform custom validation logic here
    // and return an error message if necessary
    if (value!.length < pinLength) {
      return 'Invalid PIN';
    }
    return null;
  },
  onFullfil: () {
    // Perform action when PIN is fully entered
  },
  onResetError: () {
    // Reset the error state of the PIN field
  },
  errorText: 'Invalid PIN',
  focusNode: FocusNode(),
)
```

In this example, the AntiPin widget is created with a pinController for managing the PIN input field. The onValidator callback is used to perform custom validation logic on the entered PIN. If the validation fails, the callback should return an error message. The onFullfil callback is triggered when the PIN is fully entered and validated. The onResetError callback is used to reset the error state of the PIN field. The errorText property is used to display a pre-defined error message below the PIN field. The focusNode property is used to manage the focus state of the PIN input field.
