# slide_to_confirm

A customizable slider that will activate a callback when the user slides it to 100%.

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
slide_to_confirm: <latest_version>
```

## Usage

```dart
import 'package:slide_to_confirm/slide_to_confirm.dart';

class MyWidget extends StatelessWidget {

    void confirmed(){
        print('Slider confirmed!');
    }

    Widget build(BuildContext context) {
        return ConfirmationSlider(
            onConfirmation: () => confirmed(),
        );
    }
}
```

## Properties

- **height** `double`: Height of the slider. Defaults to `70`.
- **width** `double`: Width of the slider. Defaults to `300`.
- **backgroundColor** `Color`: The color of the background of the slider. Defaults to `Colors.white`.
- **backgroundColorEnd** `Color`: The color of the background of the slider when it has been slide to the end. By giving a value here, the background color will gradually change from `backgroundColor` to `backgroundColorEnd` when the user slides. Is not used by default.
- **foregroundColor** `Color`: The color of the moving element of the slider. Defaults to `Colors.blueAccent`.
- **iconColor** `Color`: The color of the icon on the moving element if `icon` is IconData. Defaults to `Colors.white`.
- **sliderButtonContent** `Widget` or : The icon widget used on the moving element of the slider. Defaults to `Icon(Icons.chevron_right)`.
- **shadow** `BoxShadow`: The shadow below the slider. Defaults to `BoxShadow(color: Colors.black38, offset: Offset(0, 2),blurRadius: 2,spreadRadius: 0,)`.
- **text** `String`: The text showed below the foreground. Used to specify the functionality to the user. Defaults to `"Slide to confirm"`.
- **textStyle** `TextStyle`: The style of the text. Defaults to `TextStyle(color: Colors.black26, fontWeight: FontWeight.bold,)`.
- **onConfirmation** `VoidCallback`: The callback when slider is completed. **This is the only required field**.
- **onTapDown** `VoidCallback`: The callback when slider is pressed.
- **onTapUp** `VoidCallback`: The callback when slider is release.
- **foregroundShape** `BorderRadius`: The shape of the foreground (the moving element of the slider). Defaults to a circular border radius.
- **backgroundShape** `BorderRadius`: The shape of the background of the slider. Defaults to a circular border radius.
- **stickToEnd** `bool`: Bool that indicates if stick or not the cursor at end of slide

## Example

View the Flutter app in the `example` directory to see a working example of how to use and implement the slider and how to test it.

## Screenshots

![Slider Gif](https://github.com/Friiiis/slide_to_confirm/blob/master/example.gif "Slider Gif")

![Slider Gif](https://github.com/Friiiis/slide_to_confirm/blob/master/sc01.jpg "Slider Gif")

![Slider Gif](https://github.com/Friiiis/slide_to_confirm/blob/master/sc02.jpg "Slider Gif")

![Slider Gif](https://github.com/Friiiis/slide_to_confirm/blob/master/sc03.jpg "Slider Gif")

![Slider Gif](https://github.com/Friiiis/slide_to_confirm/blob/master/sc04.jpg "Slider Gif")
