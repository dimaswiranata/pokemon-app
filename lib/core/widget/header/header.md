# AntiHeader

`AntiHeader` is a customizable header widget that implements `PreferredSizeWidget`.

## Properties

|       Name       | Required |        Type         |                  Description                  |
| :--------------: | :------: | :-----------------: | :-------------------------------------------: |
|    alignTitle    |    No    | `AlignmentGeometry` | The alignment of the title within the header. |
|      title       |    No    |      `String`       |         The title text of the header.         |
|       left       |    No    |      `Widget`       |    The widget to be displayed on the left.    |
|      center      |    No    |      `Widget`       |   The widget to be displayed at the center.   |
|      right       |    No    |      `Widget`       |   The widget to be displayed on the right.    |
|     hideLeft     |    No    |       `bool`        |  Specifies whether to hide the left widget.   |
|      height      |    No    |      `double`       |      The preferred height of the header.      |
| headerDecoration |    No    |   `BoxDecoration`   |   The decoration for the header container.    |

## Usage

```dart
AntiHeader(
  alignTitle: Alignment.center,
  title: 'Header Title',
  left: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      // Perform action on press
    },
  ),
  center: Text('Header Center'),
  right: IconButton(
    icon: Icon(Icons.search),
    onPressed: () {
      // Perform action on press
    },
  ),
  hideLeft: false,
  height: 60,
  headerDecoration: BoxDecoration(
    color: Colors.blue,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 5,
      ),
    ],
  ),
)
```

In this example, the AntiHeader widget is created with an aligned title, left, center, and right widgets to be displayed in the header. The title property is set to 'Header Title', and the height property is used to define the preferred height of the header. The headerDecoration property is used to customize the background color and add a box shadow to the header container.
