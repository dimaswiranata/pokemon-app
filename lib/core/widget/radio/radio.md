# AntiRadio

`AntiRadio` is a custom radio button widget that provides visual feedback on selection.

## Properties

|   Property   | Required |    Type    |                         Description                         |
| :----------: | :------: | :--------: | :---------------------------------------------------------: |
|    `key`     |    No    |   `Key`    |                The widget's key identifier.                 |
|   `height`   |    No    |  `double`  |            The height of the `AntiRadio` widget.            |
|   `width`    |    No    |  `double`  |            The width of the `AntiRadio` widget.             |
|   `value`    |   Yes    | `dynamic`  |         The value associated with the radio button.         |
| `groupValue` |   Yes    | `dynamic`  | The currently selected value of the group of radio buttons. |
| `onChanged`  |   Yes    | `Function` | The function to be called when the radio button is tapped.  |

## Usage

```dart
AntiRadio(
  value: 'Option 1',
  groupValue: selectedValue,
  onChanged: (value) {
    setState(() {
      selectedValue = value;
    });
  },
  height: 20,
  width: 20,
)
```

In this example, an AntiRadio widget is created with the required properties, including value, groupValue, and onChanged, as well as optional properties like height and width. The value property represents the value associated with the radio button, the groupValue property represents the currently selected value of the group of radio buttons, and the onChanged property is the function to be called when the radio button is tapped.

The height and width properties customize the dimensions of the AntiRadio widget.
