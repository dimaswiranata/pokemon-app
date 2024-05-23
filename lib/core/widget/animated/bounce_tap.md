# AntiBounceTap

`AntiBounceTap` is a widget that provides a tap animation with a bounce effect for its child widget.

## Properties

| Name  | Required |    Type    |          Description           |
| :---: | :------: | :--------: | :----------------------------: |
| onTap |    No    | `Function` | Callback function when tapped. |
| icon  |    No    |  `Widget`  |  The child widget to display.  |

## Usage

```dart
AntiBounceTap(
  onTap: () {
    // Your callback function here
  },
  icon: Icon(Icons.add),
)
```

In this example, the AntiBounceTap widget wraps an Icon widget. Whenever the widget is tapped, it triggers the onTap callback function. The animation is applied using the ScaleTransition widget, which creates a scale effect with a bounce animation. The icon property defines the child widget to display.

Remember to import the necessary packages in your Flutter file:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
```
