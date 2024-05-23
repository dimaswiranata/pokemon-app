# AntiContainer

The `AntiContainer` widget provides customizable container functionality with various configuration options for layout, styling, and behavior.

## Properties

|       Name       | Required |   Type   |                       Description                       |
| :--------------: | :------: | :------: | :-----------------------------------------------------: |
|       key        |    No    |  `Key`   |            Unique identifier for the widget.            |
|      height      |    No    | `double` |                Height of the container.                 |
|      width       |    No    | `double` |                 Width of the container.                 |
|      margin      |    No    | `double` | Outer margin applied around the container on all sides. |
|    marginLeft    |    No    | `double` |        Left margin applied around the container.        |
|   marginRight    |    No    | `double` |       Right margin applied around the container.        |
|    marginTop     |    No    | `double` |        Top margin applied around the container.         |
|   marginBottom   |    No    | `double` |       Bottom margin applied around the container.       |
| marginHorizontal |    No    | `double` |     Horizontal margin applied around the container.     |
|  marginVertical  |    No    | `double` |      Vertical margin applied around the container.      |
|     padding      |    No    | `double` |    Padding space inside the container on all sides.     |
|       ...        |   ...    |   ...    |                           ...                           |
|      isHide      |    No    |  `bool`  |             Hides the container if `true`.              |

_(Include other properties similar to the provided widget.)_

## Usage

```dart
AntiContainer(
  width: 100,
  height: 100,
  margin: 10,
  padding: 15,
  bgColor: Colors.blue,
  borderRadius: 8,
  child: Container(),
)
```

In this example, an AntiContainer widget is created with a width and height of 100, a margin of 10, padding of 15, a blue background color, and a border radius of 8. It contains a child Container.
