# AntiButton

`AntiButton` is a customizable button widget with different variants and styles.

## Properties

|       Name        | Required |         Type         |                           Description                            |
| :---------------: | :------: | :------------------: | :--------------------------------------------------------------: |
|        key        |    No    |        `Key`         |               A unique identifier for this widget.               |
|       child       |    No    |       `Widget`       |             An alternative child widget to display.              |
|       text        |   Yes    |       `String`       |                The text to display on the button.                |
|     onPressed     |   Yes    |  `void Function()`   |        The callback function when the button is pressed.         |
|       type        |    No    |   `ButtonVariant?`   |                The type of button variant to use.                |
|    buttonWidth    |    No    |      `double?`       |                     The width of the button.                     |
|   buttonHeight    |    No    |      `double?`       |                    The height of the button.                     |
| paddingHorizontal |    No    |      `double?`       |              The horizontal padding of the button.               |
|      bgColor      |    No    |       `Color?`       |               The background color of the button.                |
|  disableBgColor   |    No    |       `Color?`       |           The background color of the disabled button.           |
| disableTextColor  |    No    |       `Color?`       |              The text color of the disabled button.              |
|   outlinedColor   |    No    |       `Color?`       |        The border color for the outlined button variant.         |
|     textStyle     |    No    |     `TextStyle?`     |                  The text style of the button.                   |
|      loading      |    No    |       `bool?`        |           Specifies whether to show a loading spinner.           |
|     disabled      |    No    |       `bool?`        |            Specifies whether the button is disabled.             |
|   loadingColor    |    No    |       `Color?`       |                The color of the loading spinner.                 |
|       size        |    No    |    `ButtonSize?`     |                     The size of the button.                      |
|       left        |    No    |      `Widget?`       | An additional widget to display on the left side of the button.  |
|       right       |    No    |      `Widget?`       | An additional widget to display on the right side of the button. |
|       color       |    No    |    `ButtonColor?`    |                  The color style of the button.                  |
|   borderRadius    |    No    |   `BorderRadius?`    |                 The border radius of the button.                 |
|     mainAxis      |    No    | `MainAxisAlignment?` |      The alignment of the main axis for the button's child.      |

## Usage

```dart
AntiButton(
  text: "Press Me",
  onPressed: () {
    print("Button Pressed");
  },
  type: ButtonVariant.filled,
  buttonWidth: 200,
  buttonHeight: 50,
  disabled: false,
  loading: true,
  color: ButtonColor.primary,
)
```

In this example, the AntiButton widget is created with the text "Press Me". The onPressed property specifies the callback function when the button is pressed. The type property is set to ButtonVariant.filled to create a solid-filled button. Additional properties like buttonWidth, buttonHeight, disabled, loading, and color customize the appearance and behavior of the button.
