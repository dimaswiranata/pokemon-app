# AntiLoading

`AntiLoading` is a widget that displays a loading indicator. It provides a customizable loading indicator based on the platform.

## Properties

|  Name  | Required |         Type         |               Description                |
| :----: | :------: | :------------------: | :--------------------------------------: |
| height |    No    |       `double`       |   The height of the loading indicator.   |
| width  |    No    |       `double`       |   The width of the loading indicator.    |
| color  |    No    |       `Color`        |   The color of the loading indicator.    |
| margin |    No    | `EdgeInsetsGeometry` | The margin around the loading indicator. |

## Usage

```dart
AntiLoading(
  height: 16,
  width: 16,
  color: Colors.blue,
  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
)
```

In this example, the AntiLoading widget is created with a height of 16, width of 16, color set to blue, and a margin of 10 horizontally and 20 vertically. The loading indicator will be displayed based on the platform, with a circular indicator on Android and a Cupertino-style indicator on iOS.
