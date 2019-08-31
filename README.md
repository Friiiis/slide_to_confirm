# confirmation_slider

A slider that will activate a callback when the user slides it to 100%.

## Screenshots

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  confirmation_slider: <latest_version>
```

## Usage

```dart
import 'package:confirmation_slider/confirmation_slider.dart';

class MyWidget extends StatelessWidget {

    void confirmed(){
        print('Slider confirmed!');
    }

    Widget build(BuildContext context) {
        return ConfirmationSlider(
            onConfirmation: ConfirmationSlider(
                onConfirmation: () => confirmed(),
            ),
        );
    }
}
```

## Example

View the Flutter app in the `example` directory to see a working example of how to use and implement the slider.

## Contributors

Gustav Friis-Hansen: https://github.com/Friiiis?tab=repositories