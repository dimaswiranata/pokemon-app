# AntiTabbar

`AntiTabbar` is a widget that displays a tab bar with customizable item layouts and views.

## Properties

|      Name       | Required |            Type             |                            Description                             |
| :-------------: | :------: | :-------------------------: | :----------------------------------------------------------------: |
|   tabbarItems   |   Yes    |     `List<TabbarItem>`      |          The list of tab bar items that define each tab.           |
|   tabbarViews   |   Yes    |       `List<Widget>`        |           The list of corresponding views for each tab.            |
|      type       |    No    |        `TabbarType?`        |         The type of tab bar (default: TabbarType.CAPSULE).         |
|    itemWidth    |    No    |          `double?`          |                    The width of each tab item.                     |
|  hasPaddingTop  |    No    |           `bool`            |             Determines if the tab bar has top padding.             |
| hasScrollEffect |    No    |           `bool`            | Determines if the tab bar has a scroll effect when selecting tabs. |
|   initialPage   |    No    |           `int?`            |            The initial page to display in the tab bar.             |
|     onSwipe     |    No    | `void Function(int value)?` |      A callback function that is called when a tab is swiped.      |
|  onTapTabItem   |    No    | `void Function(int value)?` |   A callback function that is called when a tab item is tapped.    |

## Usage

```dart
AntiTabbar(
  tabbarItems: [
    TabbarItem(name: 'Tab 1', hasNotif: true),
    TabbarItem(name: 'Tab 2', hasNotif: false),
    TabbarItem(name: 'Tab 3', hasNotif: false),
  ],
  tabbarViews: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  type: TabbarType.CAPSULE,
  itemWidth: 100,
  hasPaddingTop: false,
  hasScrollEffect: false,
  initialPage: 0,
  onSwipe: (int value) {
    // Handle swipe event
  },
  onTapTabItem: (int value) {
    // Handle tab item tap event
  },
)
```

In this example, the AntiTabbar widget is created with tabbarItems, a list of TabbarItem objects that define each tab, and tabbarViews, a list of views corresponding to each tab.

The type property is used to specify the type of tab bar layout, with the default being TabbarType.CAPSULE. The itemWidth, hasPaddingTop, hasScrollEffect, initialPage, onSwipe, and onTapTabItem properties can be used to further customize the tab bar behavior.
