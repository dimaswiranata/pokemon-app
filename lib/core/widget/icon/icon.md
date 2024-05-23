# AntiIcon

`AntiIcon` is a customizable widget that displays an icon. It supports different icon types and provides options for customizing the icon's appearance.

## Properties

|     Name      | Required |      Type       |            Description            |
| :-----------: | :------: | :-------------: | :-------------------------------: |
|   iconType    |    No    |   `IconType`    | The type of icon to be displayed. |
|   iconName    |    No    |    `dynamic`    |   The name or key of the icon.    |
| textDirection |    No    | `TextDirection` |  The text direction of the icon.  |
|     size      |    No    |    `double`     |       The size of the icon.       |
|     fill      |    No    |    `double`     |       The fill of the icon.       |
|    weight     |    No    |    `double`     |      The weight of the icon.      |
|     grade     |    No    |    `double`     |      The grade of the icon.       |
|  opticalSize  |    No    |    `double`     |   The optical size of the icon.   |
|     color     |    No    |     `Color`     |      The color of the icon.       |
|    shadows    |    No    | `List<Shadow>`  |     The shadows of the icon.      |
| semanticLabel |    No    |    `String`     |  The semantic label of the icon.  |

## Usage

```dart
AntiIcon(
  iconType: IconType.filled,
  iconName: IconName.commerce_barcode,
  textDirection: TextDirection.ltr,
  size: 24,
  fill: 0.5,
  weight: 0.5,
  grade: 0.5,
  opticalSize: 12,
  color: Colors.blue,
  shadows: [Shadow(offset: Offset(2, 2), blurRadius: 3, color: Colors.black)],
  semanticLabel: 'Icon Label',
)
```

In this example, the AntiIcon widget is created with the iconType set to IconType.filled and the iconName set to IconName.commerce_barcode. The textDirection is set to TextDirection.ltr, and various other properties like size, fill, weight, grade, opticalSize, color, shadows, and semanticLabel are used to customize the appearance and behavior of the icon.
