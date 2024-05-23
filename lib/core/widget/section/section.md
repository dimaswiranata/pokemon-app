# AntiSection

`AntiSection` is a custom container widget that displays a section with optional left and right components.

## Properties

|          Name          | Required |        Type        |                          Description                           |
| :--------------------: | :------: | :----------------: | :------------------------------------------------------------: |
|          hide          |    No    |       `bool`       |              Whether to hide the entire section.               |
|       hideRight        |    No    |       `bool`       |              Whether to hide the right component.              |
|       rightTitle       |    No    |     `String?`      |               The title for the right component.               |
|         right          |    No    |     `Widget?`      |           The custom widget to display on the right.           |
|      rightOnPress      |    No    | `void Function()?` | The function to be called when the right component is pressed. |
|     rightTextStyle     |    No    |    `TextStyle?`    |              The text style for the right title.               |
|        hideLeft        |    No    |       `bool`       |              Whether to hide the left component.               |
|          left          |    No    |     `Widget?`      |           The custom widget to display on the left.            |
|       leftTitle        |    No    |     `String?`      |               The title for the left component.                |
|      leftOnPress       |    No    | `void Function()?` | The function to be called when the left component is pressed.  |
|     leftTextStyle      |    No    |    `TextStyle?`    |               The text style for the left title.               |
|        children        |    No    |     `Widget?`      |              The child widget(s) of the section.               |
|    headerMarginTop     |    No    |     `double?`      |             The top margin for the header section.             |
| headerMarginHorizontal |    No    |     `double?`      |         The horizontal margin for the header section.          |
|   headerMarginBottom   |    No    |     `double?`      |           The bottom margin for the header section.            |
|        bgColor         |    No    |      `Color?`      |             The background color for the section.              |

## Usage

```dart
AntiSection(
  hide: false,
  hideRight: false,
  rightTitle: 'Next',
  rightOnPress: () {
    // Perform action on right component press
  },
  hideLeft: false,
  leftTitle: 'Back',
  leftOnPress: () {
    // Perform action on left component press
  },
  children: Container(
    width: double.infinity,
    height: 100,
    color: Colors.grey,
  ),
  bgColor: Colors.white,
)
```

In this example, the AntiSection widget is created with optional left and right components. The hide, hideRight, and hideLeft properties are set to false, indicating that the entire section and both components will be visible. The rightTitle and leftTitle properties specify the titles for the right and left components, respectively. The rightOnPress and leftOnPress properties define the callback functions for when the components are pressed. The children property specifies the child widget(s) to be displayed within the section. The bgColor property sets the background color of the section to Colors.white.
