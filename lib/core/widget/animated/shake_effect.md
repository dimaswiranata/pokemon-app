# AntiShakeEffect

`AntiShakeEffect` is a widget that applies a shaking animation to its child widget using the provided animation.

## Properties

|    Name     | Required |        Type         |                      Description                      |
| :---------: | :------: | :-----------------: | :---------------------------------------------------: |
|     key     |    No    |        `Key`        |         A unique identifier for this widget.          |
|    child    |   Yes    |      `Widget`       |             The child widget to animate.              |
|  animation  |   Yes    | `Animation<double>` |      The animation to drive the shaking effect.       |
| shakeOffset |    No    |      `double`       |   The maximum offset value for the shaking effect.    |
| shakeCount  |    No    |      `double`       | The number of shakes to perform during the animation. |

## Usage

```dart
AntiShakeEffect(
  child: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
  ),
  animation: animation,
  shakeOffset: 2.0,
  shakeCount: 4.0,
)
```

In this example, the AntiShakeEffect widget applies a shaking animation to a Container widget with a blue background color. The child property is required and must be a valid Flutter widget. The animation property is also required and should be an instance of Animation<double>. The shakeOffset property determines the maximum offset value for the shaking effect, while the shakeCount property specifies the number of shakes to perform during the animation.
