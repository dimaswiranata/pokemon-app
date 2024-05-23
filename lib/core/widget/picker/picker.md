# AntiPicker

`AntiPicker` is a customizable picker widget that displays a list of selectable items.

## Properties

|   Name   | Required |             Type             |                   Description                   |
| :------: | :------: | :--------------------------: | :---------------------------------------------: |
|  title   |    No    |           `String`           |            The title of the picker.             |
|   data   |    No    |     `List<ItemPicker>?`      |          The list of selectable items.          |
| onSelect |    No    | `void Function(ItemPicker)?` | The callback function when an item is selected. |

## Usage

```dart
AntiPicker(
  title: 'Select Item',
  data: [
    ItemPicker(title: 'Item 1'),
    ItemPicker(title: 'Item 2'),
    ItemPicker(title: 'Item 3'),
  ],
  onSelect: (item) {
    // Perform action when an item is selected
  },
)
```

In this example, the AntiPicker widget is created with a title set to 'Select Item' and a data list containing three ItemPicker objects. The onSelect callback is used to perform an action when an item is selected.
