# AntiTooltip

`AntiTooltip` is a widget that displays a tooltip with customizable options.

## Properties

|             Name             | Required |           Type           |                                    Description                                    |
| :--------------------------: | :------: | :----------------------: | :-------------------------------------------------------------------------------: |
|           content            |   Yes    |         `Widget`         |                         The content widget of the tooltip                         |
|        popupDirection        |    No    |    `TooltipDirection`    |              The direction in which the tooltip should be displayed               |
|          controller          |    No    | `SuperTooltipController` |          The controller for the tooltip, used for advanced configuration          |
|         onLongPress          |    No    |       `Function()`       |             The function to be triggered on long press of the tooltip             |
|            onShow            |    No    |       `Function()`       |              The function to be triggered when the tooltip is shown               |
|            onHide            |    No    |       `Function()`       |              The function to be triggered when the tooltip is hidden              |
|    snapsFarAwayVertically    |    No    |          `bool`          |  Whether the tooltip should snap to a position further away vertically if needed  |
|   snapsFarAwayHorizontally   |    No    |          `bool`          | Whether the tooltip should snap to a position further away horizontally if needed |
|          hasShadow           |    No    |          `bool`          |                  Whether the tooltip should have a shadow effect                  |
|         shadowColor          |    No    |         `Color`          |                   The color of the shadow effect of the tooltip                   |
|       shadowBlurRadius       |    No    |         `double`         |                The blur radius of the shadow effect of the tooltip                |
|      shadowSpreadRadius      |    No    |         `double`         |               The spread radius of the shadow effect of the tooltip               |
|             top              |    No    |         `double`         |            The position of the tooltip from the top edge of the screen            |
|            right             |    No    |         `double`         |           The position of the tooltip from the right edge of the screen           |
|            bottom            |    No    |         `double`         |          The position of the tooltip from the bottom edge of the screen           |
|             left             |    No    |         `double`         |           The position of the tooltip from the left edge of the screen            |
|     minimumOutsideMargin     |    No    |         `double`         |                      The minimum margin outside the tooltip                       |
|        verticalOffset        |    No    |         `double`         |             The vertical offset of the tooltip from the child widget              |
|          elevation           |    No    |         `double`         |                           The elevation of the tooltip                            |
|       backgroundColor        |    No    |         `Color`          |                        The background color of the tooltip                        |
|          decoration          |    No    |       `Decoration`       |                           The decoration of the tooltip                           |
|            child             |    No    |         `Widget`         |                    The child widget that triggers the tooltip                     |
|         borderColor          |    No    |         `Color`          |                      The color of the border of the tooltip                       |
|         constraints          |    No    |     `BoxConstraints`     |                          The constraints of the tooltip                           |
|        fadeInDuration        |    No    |        `Duration`        |               The duration for the fade-in animation of the tooltip               |
|       fadeOutDuration        |    No    |        `Duration`        |              The duration for the fade-out animation of the tooltip               |
|         arrowLength          |    No    |         `double`         |                      The length of the arrow of the tooltip                       |
|        arrowBaseWidth        |    No    |         `double`         |                    The base width of the arrow of the tooltip                     |
|       arrowTipDistance       |    No    |         `double`         |                  The distance of the arrow tip from the tooltip                   |
|         borderRadius         |    No    |         `double`         |                         The border radius of the tooltip                          |
|         borderWidth          |    No    |         `double`         |                      The width of the border of the tooltip                       |
|         showBarrier          |    No    |          `bool`          |                   Whether to show a barrier behind the tooltip                    |
|         barrierColor         |    No    |         `Color`          |                    The color of the barrier behind the tooltip                    |
|       touchThrougArea        |    No    |          `Rect`          |         The area of the tooltip that allows touch events to pass through          |
|    touchThroughAreaShape     |    No    |     `ClipAreaShape`      |                The shape of the touch-through area of the tooltip                 |
| touchThroughAreaCornerRadius |    No    |         `double`         |            The corner radius of the touch-through area of the tooltip             |
|      overlayDimensions       |    No    |   `EdgeInsetsGeometry`   |               The dimensions of the overlay surrounding the tooltip               |
|       bubbleDimensions       |    No    |   `EdgeInsetsGeometry`   |                       The dimensions of the tooltip bubble                        |
|            sigmaX            |    No    |         `double`         |           The horizontal standard deviation of the Gaussian blur filter           |
|            sigmaY            |    No    |         `double`         |            The vertical standard deviation of the Gaussian blur filter            |
|      showDropBoxFilter       |    No    |          `bool`          |              Whether to show a drop box filter effect on the tooltip              |

## Usage

```dart
AntiTooltip(
  content: Text('Tooltip content'),
  popupDirection: TooltipDirection.down,
  controller: myController,
  onLongPress: () {
    // Perform action on long press of the tooltip
  },
  onShow: () {
    // Perform action when the tooltip is shown
  },
  onHide: () {
    // Perform action when the tooltip is hidden
  },
  showCloseButton: ShowCloseButton.inside,
  closeButtonColor: Colors.white,
  closeButtonSize: 20.0,
  showBarrier: true,
  barrierColor: Colors.black.withOpacity(0.5),
  snapsFarAwayVertically: true,
  snapsFarAwayHorizontally: true,
  hasShadow: true,
  shadowColor: Colors.grey,
  shadowBlurRadius: 10.0,
  shadowSpreadRadius: 2.0,
  top: 30.0,
  right: 20.0,
  bottom: 30.0,
  left: 20.0,
  minimumOutsideMargin: 20.0,
  verticalOffset: 5.0,
  elevation: 4.0,
  backgroundColor: Colors.blue,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
  child: IconButton(
    icon: Icon(Icons.info),
    onPressed: () {
      // Perform action when the child widget is pressed
    },
  ),
  borderColor: Colors.black,
  constraints: BoxConstraints(minHeight: 80, maxWidth: 200),
  fadeInDuration: Duration(milliseconds: 200),
  fadeOutDuration: Duration(milliseconds: 200),
  arrowLength: 10.0,
  arrowBaseWidth: 12.0,
  arrowTipDistance: 2.0,
  borderRadius: 8.0,
  borderWidth: 1.0,
  showBarrier: true,
  barrierColor: Colors.black.withOpacity(0.5),
  touchThroughArea: Rect.fromLTWH(0, 0, 100, 100),
  touchThroughAreaShape: ClipAreaShape.circle,
  touchThroughAreaCornerRadius: 10.0,
  overlayDimensions: EdgeInsets.all(15),
  bubbleDimensions: EdgeInsets.all(20),
  sigmaX: 5.0,
  sigmaY: 5.0,
  showDropBoxFilter: true,
)
```

In this example, the AntiTooltip widget is created with various options. It has a custom content widget, is displayed downwards, and has several event callbacks. It has a close button inside the tooltip with a white color and size of 20.0. It also shows a barrier with a black color and 50% opacity. The tooltip snaps far away both vertically and horizontally, has a shadow effect, and is positioned with top, right, bottom, and left offsets. The tooltip has a blue background with a border radius of 8.0. The child widget is an IconButton displaying an info icon. The tooltip has a black border, defined constraints, fade-in and fade-out durations, arrow dimensions, a border radius, and a border width. It also has a touch-through area, overlay and bubble dimensions, a Gaussian blur filter, and a drop box filter effect.
