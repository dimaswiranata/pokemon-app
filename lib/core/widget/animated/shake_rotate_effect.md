# ShakeRotateEffect

`ShakeRotateEffect` is a widget that applies a shaking and rotating animation to its child widget using the provided animation.

## Properties

|   Name    | Required |        Type         |                       Description                       |
| :-------: | :------: | :-----------------: | :-----------------------------------------------------: |
|    key    |    No    |        `Key`        |          A unique identifier for this widget.           |
|   child   |   Yes    |      `Widget`       |              The child widget to animate.               |
| animation |   Yes    | `Animation<double>` | The animation to drive the shaking and rotating effect. |
|   begin   |    No    |      `double`       |        The beginning rotation value in radians.         |
|    end    |    No    |      `double`       |          The ending rotation value in radians.          |

## Usage

```dart
ShakeRotateEffect(
  child: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
  ),
  animation: animation,
  begin: 0.0,
  end: 0.01,
)
```

In this example, the ShakeRotateEffect widget applies a shaking and rotating animation to a Container widget with a blue background color. The child property is required and must be a valid Flutter widget. The animation property is also required and should be an instance of Animation<double>. The begin property determines the beginning rotation value in radians, while the end property specifies the ending rotation value in radians.
