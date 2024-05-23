# AntiAnimatedOpacity

`AntiAnimatedOpacity` is a widget that provides opacity animation for its child widget.

## Properties

|     Name     | Required |      Type      |                  Description                  |
| :----------: | :------: | :------------: | :-------------------------------------------: |
|     key      |    No    |     `Key`      |     A unique identifier for this widget.      |
|    child     |   Yes    |    `Widget`    |         The child widget to animate.          |
|     type     |    No    | `OpacityType`  |        The type of opacity animation.         |
|  isSelected  |    No    |     `bool`     |  Determines whether the widget is selected.   |
| milliseconds |    No    |     `int`      |    The duration of the opacity animation.     |
|    curves    |    No    |    `Curve`     |     The curve for the opacity animation.      |
|    onEnd     |    No    | `VoidCallback` | Callback function when the animation is done. |

## Usage

```dart
AntiAnimatedOpacity(
  child: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
  ),
  type: OpacityType.FADE_IN,
  isSelected: true,
  milliseconds: 500,
  curves: Curves.easeInOut,
  onEnd: () {
    print("Opacity animation ended");
  },
)
```

In this example, the AntiAnimatedOpacity widget is animating a Container widget with a blue background color. The child property is required and must be a valid Flutter widget. The type property represents the type of opacity animation, and isSelected determines whether the widget is selected. Both milliseconds and curves control the animation duration and curve respectively. Lastly, the onEnd callback function is called when the animation is completed.
