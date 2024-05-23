# AntiCheckbox

`AntiCheckbox` is a customizable checkbox widget.

## Properties

|   Name    | Required |       Type        |                          Description                          |
| :-------: | :------: | :---------------: | :-----------------------------------------------------------: |
|    key    |    No    |       `Key`       |             A unique identifier for this widget.              |
|   value   |   Yes    |      `bool`       |              The current value of the checkbox.               |
| onChanged |   Yes    | `void Function()` | The callback function when the value of the checkbox changes. |
|  height   |    No    |     `double`      |                  The height of the checkbox.                  |
|   width   |    No    |     `double`      |                  The width of the checkbox.                   |

## Usage

```dart
AntiCheckbox(
  value: true,
  onChanged: (newValue) {
    print('Checkbox value changed: $newValue');
  },
  height: 24,
  width: 36,
)
```

In this example, the AntiCheckbox widget is created with a height of 24 and width of 36. The value property is set to true, indicating that the checkbox is checked. The onChanged callback function handles changes to the checkbox value, printing the new value to the console.
