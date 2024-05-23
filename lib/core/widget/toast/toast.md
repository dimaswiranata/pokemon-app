# AntiToast

`AntiToast` is a widget that displays a toast message with customizable options.

## Properties

|     Name      | Required |      Type      |                                      Description                                      |
| :-----------: | :------: | :------------: | :-----------------------------------------------------------------------------------: |
|    onClose    |    No    |  `Function()`  |             The function to be triggered when the close button is tapped              |
|     onTap     |    No    |  `Function()`  |                 The function to be triggered when the toast is tapped                 |
|     type      |    No    |  `ToastType`   |               The type of toast message (ERROR, WARNING, SUCCESS, INFO)               |
|    variant    |    No    | `ToastVariant` |               The variant style of the toast (FILLED, OUTLINE, BOXLESS)               |
|    rounded    |    No    |    `double`    |                        The degree of roundedness for the toast                        |
|     title     |    No    |    `String`    |                            The title of the toast message                             |
|  titleStyle   |    No    |  `TextStyle`   |                   The style for the title text in the toast message                   |
|   subtitle    |    No    |    `String`    |                           The subtitle of the toast message                           |
| subTitleStyle |    No    |  `TextStyle`   |                 The style for the subtitle text in the toast message                  |
|   showClose   |    No    |     `bool`     |                 Whether to show the close button in the toast or not                  |
|     left      |    No    |    `Widget`    | The widget to be displayed on the left side of the toast (e.g., custom icon or image) |
|     right     |    No    |    `Widget`    |               The widget to be displayed on the right side of the toast               |
|    center     |    No    |    `Widget`    |                 The widget to be displayed at the center of the toast                 |

## Usage

```dart
AntiToast(
  onClose: () {
    // Perform action on close button tap
  },
  onTap: () {
    // Perform action on toast tap
  },
  type: ToastType.ERROR,
  variant: ToastVariant.filled,
  rounded: 8.0,
  title: 'Error',
  titleStyle: TextStyle(fontWeight: FontWeight.bold),
  subtitle: 'Something went wrong.',
  subTitleStyle: TextStyle(color: Colors.red),
  showClose: true,
  left: Icon(Icons.error),
  right: Icon(Icons.clear),
  center: Container(),
)
```

In this example, the AntiToast widget is created with a variety of options. It has a close button, an error type, a filled variant style, and a rounded border with a radius of 8.0. The title is set to 'Error', the title style is set to bold, the subtitle is set to 'Something went wrong.', and the subtitle style is set to red. The left widget is an error icon, and the right widget is a close icon. The center widget is an empty container.
