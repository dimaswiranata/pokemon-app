# AntiModal

`AntiModal` is a customizable modal widget that provides a dismissible bottom sheet-like behavior.

## Properties

|  Name  | Required |         Type          |         Description          |
| :----: | :------: | :-------------------: | :--------------------------: |
| appBar |    No    | `PreferredSizeWidget` | The app bar to be displayed. |
|  body  |   Yes    |       `Widget`        |  The content of the modal.   |

## Usage

```dart
AntiModal(
  appBar: AppBar(title: Text('Modal Title')),
  body: Container(
    padding: EdgeInsets.all(16),
    child: Text('Modal Body'),
  ),
)
```

In this example, the AntiModal widget is created with an optional appBar property, which can be used to display a title or any other content in the app bar. The body property is set to the content of the modal, which could be any widget.

The result is a customizable modal widget that provides a bottom sheet-like behavior, with a dismissible feature. The appBar and body properties allow you to customize the content of the modal according to your needs.
