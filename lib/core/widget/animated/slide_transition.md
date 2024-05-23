# AntiSlideTransition

`AntiSlideTransition` is a widget that applies a slide animation to its child widget using the provided animation.

## Properties

|   Name    | Required |        Type         |             Description              |
| :-------: | :------: | :-----------------: | :----------------------------------: |
|    key    |    No    |        `Key`        | A unique identifier for this widget. |
|   child   |   Yes    |      `Widget`       |     The child widget to animate.     |
| animation |   Yes    | `Animation<double>` | The animation to apply to the child. |

## Usage

```dart
AntiSlideTransition(
  child: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
  ),
  animation: animation,
)
```

In this example, the AntiSlideTransition widget applies a slide animation to a Container widget with a blue background color. The child property is required and must be a valid Flutter widget. The animation property is also required and should be an instance of Animation<double>. The slide animation is applied to the child widget based on the provided animation.
