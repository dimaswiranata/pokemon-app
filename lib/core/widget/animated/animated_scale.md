# AntiAnimatedScale

`AntiAnimatedScale` is a widget that provides scale animation for its child widget.

## Properties

|     Name     | Required |      Type      |                  Description                  |
| :----------: | :------: | :------------: | :-------------------------------------------: |
|     key      |    No    |     `Key`      |     A unique identifier for this widget.      |
|    child     |   Yes    |    `Widget`    |         The child widget to animate.          |
|  isSelected  |    No    |     `bool`     |  Determines whether the widget is selected.   |
| milliseconds |    No    |     `int`      |     The duration of the scale animation.      |
|    curves    |    No    |    `Curve`     |      The curve for the scale animation.       |
|    onEnd     |    No    | `VoidCallback` | Callback function when the animation is done. |
| initialScale |    No    |    `double`    | The initial scale value of the child widget.  |
|  finalScale  |    No    |    `double`    |  The final scale value of the child widget.   |

## Usage

```dart
AntiAnimatedScale(
  child: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
  ),
  isSelected: true,
  milliseconds: 500,
  curves: Curves.easeInOut,
  onEnd: () {
    print("Scale animation ended");
  },
  initialScale: 0.99,
  finalScale: 1.0,
)
```

In this example, the AntiAnimatedScale widget is animating a Container widget with a blue background color. The child property is required and must be a valid Flutter widget. The isSelected property determines whether the widget is selected for scaling. The milliseconds property controls the animation duration. The curves property defines the animation curve for smoother scaling. The onEnd callback function is called when the animation is completed. The initialScale and finalScale properties specify the initial and final scale values of the child widget, respectively.
