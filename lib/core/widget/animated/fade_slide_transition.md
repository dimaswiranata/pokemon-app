# AntiFadeSlideTransition

`AntiFadeSlideTransition` is a combination of the `AntiSlideTransition` and `AntiAnimatedOpacity` widgets, providing a fade and slide animation for its child widget.

## Properties

|     Name     | Required |        Type         |                      Description                      |
| :----------: | :------: | :-----------------: | :---------------------------------------------------: |
|     key      |    No    |        `Key`        |         A unique identifier for this widget.          |
|  animation   |   Yes    | `Animation<double>` | The animation to drive the fade and slide transition. |
|    child     |   Yes    |      `Widget`       |             The child widget to animate.              |
|     type     |    No    |   `OpacityType?`    |            The type of opacity animation.             |
|  isSelected  |    No    |       `bool?`       |      Determines whether the widget is selected.       |
| milliseconds |    No    |       `int?`        |        The duration of the opacity animation.         |
|    curves    |    No    |      `Curve?`       |         The curve for the opacity animation.          |

## Usage

```dart
AntiFadeSlideTransition(
  animation: animation,
  child: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
  ),
  type: OpacityType.FADE_IN,
  isSelected: true,
  milliseconds: 500,
  curves: Curves.easeInOut,
)
```

In this example, the AntiFadeSlideTransition widget combines the AntiSlideTransition and AntiAnimatedOpacity widgets. The animation property is required and should be an instance of Animation<double>. The child property is also required and must be a valid Flutter widget. The type, isSelected, milliseconds, and curves properties are optional and control the opacity animation. This widget fades and slides its child widget based on the provided animation properties.
