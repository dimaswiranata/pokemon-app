# AntiImage

`AntiImage` is a customizable image widget that supports loading images from various sources, including assets and network URLs.

## Properties

|     Name     | Required |         Type         |                Description                |
| :----------: | :------: | :------------------: | :---------------------------------------: |
|   imageUrl   |   Yes    |       `String`       |    The URL or asset path of the image.    |
|    height    |   Yes    |       `double`       |         The height of the image.          |
|    width     |   Yes    |       `double`       |          The width of the image.          |
|     file     |    No    |        `File`        |    The file containing the image data.    |
|    margin    |    No    | `EdgeInsetsGeometry` |       The margin around the image.        |
| borderRadius |    No    |       `double`       |      The border radius of the image.      |
| colorFilter  |    No    |    `ColorFilter`     |      The color filter for the image.      |
|     fit      |    No    |       `BoxFit`       |   The fit mode for rendering the image.   |
|   children   |    No    |       `Widget`       | Additional child widgets to be displayed. |
|   opacity    |    No    |       `double`       |         The opacity of the image.         |

## Usage

```dart
AntiImage(
  imageUrl: 'https://example.com/image.jpg',
  height: 200,
  width: 200,
  file: File('path/to/image/file.png'),
  margin: EdgeInsets.all(8),
  borderRadius: 10,
  colorFilter: ColorFilter.mode(Colors.red, BlendMode.color),
  fit: BoxFit.cover,
  opacity: 0.8,
  children: [
    Positioned(
      bottom: 10,
      right: 10,
      child: Text('Additional Text'),
    ),
  ],
)
```

In this example, the AntiImage widget is created with the imageUrl set to a network URL, height and width set to 200, and a file set to a local image file. The margin, borderRadius, colorFilter, fit, and opacity properties are used to customize the appearance of the image. The children property is used to add additional child widgets to be displayed on top of the image.
