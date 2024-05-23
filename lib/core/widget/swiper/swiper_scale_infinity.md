# AntiSwiperScaleInfinity

`AntiSwiperScaleInfinity` is a widget that displays a scaled page view with a customizable scaling effect, allowing for infinite scrolling.

## Properties

|       Name       | Required |              Type              |                            Description                            |
| :--------------: | :------: | :----------------------------: | :---------------------------------------------------------------: |
|  pageController  |   Yes    |        `PageController`        |                 The controller for the page view.                 |
|    listLength    |   Yes    |             `int`              |              The total number of items in the list.               |
| currentPageValue |   Yes    |            `double`            |           The current progress value of the page view.            |
|  onPageChanged   |    No    |        `Function(int)?`        |     A callback function that is called when the page changes.     |
|    buildChild    |   Yes    | `Widget Function(double, int)` |       A function that builds a child widget for each item.        |
|  inactiveScale   |    No    |            `double`            | The amount of scaling applied to inactive items. Default is 0.11. |

## Usage

```dart
AntiSwiperScaleInfinity(
  pageController: _pageController,
  listLength: 10,
  currentPageValue: _currentPageValue,
  onPageChanged: (int value) {
    // Handle page change here
  },
  buildChild: (double scale, int index) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Item ${index % 10}',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  },
  inactiveScale: 0.11,
)
```

In this example, the AntiSwiperScaleInfinity widget is created with a pageController, listLength, currentPageValue, onPageChanged, buildChild function, and an optional inactiveScale property.

The buildChild function is called to build a child widget for each item in the list. The scale parameter represents the scaling factor, and the index parameter is obtained using modulo operator % to ensure it wraps around within the list length.
