# AntiTouchable

`AntiTouchable` is a widget that provides a touchable area with customizable options.

## Properties

|      Name       | Required |         Type         |                               Description                                |
| :-------------: | :------: | :------------------: | :----------------------------------------------------------------------: |
|     height      |    No    |       `double`       |                     The height of the touchable area                     |
|      width      |    No    |       `double`       |                     The width of the touchable area                      |
|  activeOpacity  |    No    |       `double`       |           The opacity of the touchable area when it is active            |
|     margin      |    No    | `EdgeInsetsGeometry` |                     The margin of the touchable area                     |
|     padding     |    No    | `EdgeInsetsGeometry` |                    The padding of the touchable area                     |
|     radius      |    No    |       `double`       |                 The border radius of the touchable area                  |
|    children     |    No    |       `Widget`       |      The child widget(s) to be displayed within the touchable area       |
|     bgColor     |    No    |       `Color`        |                The background color of the touchable area                |
|   splashColor   |    No    |       `Color`        |            The splash color when the touchable area is tapped            |
|   hoverColor    |    No    |       `Color`        |            The hover color when the touchable area is hovered            |
| highlightColor  |    No    |       `Color`        |          The highlight color when the touchable area is pressed          |
| isHapticEnabled |    No    |        `bool`        |  Whether haptic feedback is enabled when the touchable area is pressed   |
|    onPressed    |   Yes    |  `void Function()`   | The callback function to be triggered when the touchable area is pressed |

## Usage

```dart
AntiTouchable(
  height: 50.0,
  width: 150.0,
  activeOpacity: 0.8,
  margin: EdgeInsets.all(10.0),
  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  radius: 12.0,
  children: Text('Press me!'),
  bgColor: Colors.blue,
  splashColor: Colors.green,
  hoverColor: Colors.yellow,
  highlightColor: Colors.red,
  isHapticEnabled: true,
  onPressed: () {
    // Perform action when the touchable area is pressed
  },
)
```

In this example, the AntiTouchable widget is created with various options. It has a specified height and width, an active opacity of 0.8, margins and padding, a border radius of 12.0, and a child widget displaying 'Press me!'. The touchable area has a blue background color, a splash color of green, a hover color of yellow, and a highlight color of red. Haptic feedback is enabled, and the onPressed callback function is defined.
