# AntiDialog

`AntiDialog` is a customizable dialog widget.

## Properties

|     Name      | Required |       Type        |                         Description                         |
| :-----------: | :------: | :---------------: | :---------------------------------------------------------: |
|      key      |    No    |       `Key`       |            A unique identifier for this widget.             |
|     image     |    No    |     `String`      |                The image URL for the dialog.                |
|     title     |    No    |     `String`      |                  The title of the dialog.                   |
|  titleStyle   |    No    |    `TextStyle`    |                The style for the title text.                |
|   subtitle    |    No    |     `String`      |                 The subtitle of the dialog.                 |
| subtitleStyle |    No    |    `TextStyle`    |              The style for the subtitle text.               |
|    action     |    No    |     `Widget`      |             Additional widget to be displayed.              |
|   onSuccess   |    No    | `void Function()` | The callback function when the success action is performed. |
|   onFailed    |    No    | `void Function()` | The callback function when the failed action is performed.  |

## Usage

```dart
AntiDialog(
  image: 'https://example.com/image.jpg',
  title: 'Dialog Title',
  titleStyle: TextStyle(fontSize: 20, color: Colors.black),
  subtitle: 'Dialog subtitle',
  subtitleStyle: TextStyle(fontSize: 16, color: Colors.grey),
  onSuccess: () {
    // Perform success action
  },
  onFailed: () {
    // Perform failed action
  },
  action: AntiButton(
    buttonWidth: 100,
    buttonHeight: 48,
    text: 'Button Text',
    onPressed: () {
      // Perform additional action
    },
    bgColor: Colors.blue,
  ),
)
```

In this example, the AntiDialog widget is created with an image, title, subtitle, success and failed action callbacks, and an additional action widget. The titleStyle and subtitleStyle properties are used to customize the text styles.
