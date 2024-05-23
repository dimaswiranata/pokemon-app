# ReadMoreText

`ReadMoreText` is a widget that displays truncated text with a "read more" or "read less" option.

## Properties

|       Property       | Required |       Type       |                                Description                                |
| :------------------: | :------: | :--------------: | :-----------------------------------------------------------------------: |
|        `data`        |   Yes    |     `String`     |                         The text to be displayed.                         |
|  `trimExpandedText`  |    No    |    `String?`     |              The text to display for the "read less" option.              |
| `trimCollapsedText`  |    No    |    `String?`     |              The text to display for the "read more" option.              |
|     `trimLength`     |   Yes    |      `int`       |             The maximum length of the text before truncation.             |
|     `trimLines`      |   Yes    |      `int`       |         The maximum number of lines to display before truncation.         |
|      `trimMode`      |   Yes    |    `TrimMode`    |      The mode of truncation (`TrimMode.Length` or `TrimMode.Line`).       |
|       `style`        |   Yes    |   `TextStyle`    |                          The style of the text.                           |
| `effectiveTextStyle` |   Yes    |   `TextStyle`    |         The effective style of the text, including inheritances.          |
|     `textAlign`      |    No    |   `TextAlign?`   |              The alignment of the text within its container.              |
|   `textDirection`    |    No    | `TextDirection?` |                      The directionality of the text.                      |
|       `locale`       |    No    |    `Locale?`     |                      The locale to use for the text.                      |
|  `textScaleFactor`   |    No    |    `double?`     |                    The factor used to scale the text.                     |
|   `semanticsLabel`   |    No    |    `String?`     | A label to describe the semantics of the text for accessibility purposes. |

## Usage

```dart
ReadMoreText(
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  trimExpandedText: ' read less',
  trimCollapsedText: ' ...read more',
  trimLength: 50,
  trimLines: 2,
  trimMode: TrimMode.Length,
  style: TextStyle(fontSize: 16),
  effectiveTextStyle: TextStyle(fontSize: 16, color: Colors.black),
)
```
