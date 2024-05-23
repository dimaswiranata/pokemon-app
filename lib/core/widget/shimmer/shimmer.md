# AntiShimmer

`AntiShimmer` is a widget that displays a shimmer effect to simulate loading or data fetching.

## Properties

|     Name     | Required |     Type      |                      Description                      |
| :----------: | :------: | :-----------: | :---------------------------------------------------: |
|    height    |    No    |   `double`    |           The height of the shimmer effect.           |
|    width     |   Yes    |   `double`    |           The width of the shimmer effect.            |
| borderRadius |    No    |   `double`    |          The border radius of the container.          |
|    margin    |    No    | `EdgeInsets`  |       The margin around the shimmer container.        |
|     type     |    No    | `ShimmerType` |      The type of the shimmer effect to display.       |
|     line     |    No    |     `int`     |  The number of shimmer lines to display in a column.  |
|  lineHeight  |   Yes    |   `double`    | The height of each shimmer line relative to the type. |

## Usage

```dart
AntiShimmer(
  width: 200,
  height: null,
  borderRadius: 10,
  margin: EdgeInsets.all(16),
  type: ShimmerType.titleMedium,
  line: 3,
  lineHeight: 1.5,
)
```

In this example, the AntiShimmer widget is created with the required width property along with optional properties like height, borderRadius, margin, type, line, and lineHeight.
