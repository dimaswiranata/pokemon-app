# AntiSwiper

`AntiSwiper` is a widget that displays a swipeable carousel with page indicators.

## Properties

|         Name          | Required |         Type         |                                    Description                                     |
| :-------------------: | :------: | :------------------: | :--------------------------------------------------------------------------------: |
|         page          |   Yes    |    `List<Widget>`    |                      The list of widgets to display as pages.                      |
|   viewportFraction    |    No    |       `double`       |               The fractional value of the viewport to show per page.               |
|         auto          |    No    |        `bool`        |     Determines if the carousel should automatically scroll through the pages.      |
|       duration        |    No    |        `int`         |                The duration between auto-scrolling in milliseconds.                |
|        height         |    No    |       `double`       |                          The height of the swiper widget.                          |
|         width         |    No    |       `double`       |                          The width of the swiper widget.                           |
|     showIndicator     |    No    |        `bool`        |          Determines if the page indicators should be shown at the bottom.          |
|     dotTransformX     |    No    |       `double`       |    The X offset of the page indicators. Positive values shift to the right, and    |
|                       |          |                      |                         negative values shift to the left.                         |
|     dotTransformY     |    No    |       `double`       |   The Y offset of the page indicators. Positive values shift to the bottom, and    |
|                       |          |                      |                         negative values shift to the top.                          |
|       alignment       |    No    |     `Alignment`      |           The alignment of the page indicators within the swiper widget.           |
|       dotWidth        |    No    |       `double`       |                       The width of each page indicator dot.                        |
|       dotHeight       |    No    |       `double`       |                       The height of each page indicator dot.                       |
|    dotActiveWidth     |    No    |       `double`       |                    The width of the active page indicator dot.                     |
|    dotActiveHeight    |    No    |       `double`       |                    The height of the active page indicator dot.                    |
|    dotBorderRadius    |    No    |       `double`       |        The border radius of each page indicator dot. Can be used to create         |
|                       |          |                      |                           rounded or custom-shaped dots.                           |
| dotActiveBorderRadius |    No    |       `double`       |     The border radius of the active page indicator dot. Can be used to create      |
|                       |          |                      |                           rounded or custom-shaped dots.                           |
|       dotColor        |    No    |       `Color`        |                       The color of each page indicator dot.                        |
|    dotActiveColor     |    No    |       `Color`        |                    The color of the active page indicator dot.                     |
|      dotSpacing       |    No    |       `double`       |                    The spacing between each page indicator dot.                    |
|     onChangedPage     |    No    | `void Function(int)` |         A callback function that is called when the current page changes.          |
|        effect         |    No    |  `IndicatorEffect`   | The effect to be applied to the page indicators. Default is a customizable effect. |

## Usage

```dart
AntiSwiper(
  page: [
    // Add your list of Widgets here
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  viewportFraction: 0.8,
  auto: true,
  duration: 3000,
  height: 200,
  width: double.infinity,
  showIndicator: true,
  dotTransformX: 10,
  dotTransformY: 0,
  alignment: Alignment.center,
  dotWidth: 8,
  dotHeight: 8,
  dotActiveWidth: 16,
  dotActiveHeight: 8,
  dotBorderRadius: 4,
  dotActiveBorderRadius: 4,
  dotColor: Colors.grey,
  dotActiveColor: Colors.red,
  dotSpacing: 8,
  onChangedPage: (int page) {
    // Handle page change here
  },
  effect: CustomizableEffect(
    activeDotDecoration: DotDecoration(
      width: 16,
      height: 8,
      color: Colors.red,
      borderRadius: BorderRadius.circular(4),
    ),
    dotDecoration: DotDecoration(
      width: 8,
      height: 8,
      color: Colors.grey,
      borderRadius: BorderRadius.circular(4),
    ),
    spacing: 8,
  ),
)
```

In this example, the AntiSwiper widget is created with a list of Container widgets as pages, and various optional properties to customize the swiper widget and page indicators.
