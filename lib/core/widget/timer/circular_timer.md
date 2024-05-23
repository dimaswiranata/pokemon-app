# AntiCircularTimer

`AntiCircularTimer` is a widget that displays a circular timer with customizable properties.

## Properties

|       Name       | Required |       Type       |                             Description                             |
| :--------------: | :------: | :--------------: | :-----------------------------------------------------------------: |
|    circleSize    |   Yes    |     `double`     |                   The size of the circular timer.                   |
| onTimerCompleted |    No    |  `VoidCallback`  |       A callback function triggered when the timer completes.       |
|      second      |   Yes    |      `int`       |                The duration of the timer in seconds.                |
| backgroundColor  |    No    |     `Color`      |             The background color of the circular timer.             |
|     gradient     |    No    | `LinearGradient` |                 The gradient of the circular timer.                 |
| showScaleEffect  |    No    |      `bool`      | Determines whether the circular timer should have a scaling effect. |

## Usage

```dart
AntiCircularTimer(
  circleSize: 200,
  onTimerCompleted: () {
    // Handle timer completion
  },
  second: 60,
  backgroundColor: Colors.grey,
  gradient: LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Colors.red, Colors.blue],
  ),
  showScaleEffect: true,
)
```

In this example, the AntiCircularTimer widget is created with a circleSize of 200. When the timer completes, the onTimerCompleted callback function is triggered. The timer has a duration of 60 seconds. The backgroundColor is set to Colors.grey, and the gradient is set to a linear gradient from red to blue. Additionally, the showScaleEffect property is set to true to apply a scaling effect to the circular timer.
