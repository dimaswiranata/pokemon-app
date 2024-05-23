# Pressable

`Pressable` is a widget that provides a pressable effect to its child widget.

## Properties

|     Name      | Required |    Type    |                           Description                           |
| :-----------: | :------: | :--------: | :-------------------------------------------------------------: |
|     child     |   Yes    |  `Widget`  |                        The child widget.                        |
|     onTap     |   Yes    | `Function` |              The function to be triggered on tap.               |
| activeOpacity |    No    |  `double`  |             The opacity when the widget is pressed.             |
|   duration    |    No    |   `int`    | The duration of the opacity animation when pressed or released. |

## Usage

```dart
Pressable(
  child: Container(
    width: 200,
    height: 50,
    color: Colors.blue,
    child: Center(child: Text('Press Me')),
  ),
  onTap: () {
    // Perform action on tap
  },
  activeOpacity: 0.5,
  duration: 100,
)
```

In this example, the Pressable widget is created with a child widget, an onTap callback function, activeOpacity set to 0.5, and duration set to 100 milliseconds.
