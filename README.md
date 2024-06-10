# Gestu Tweens

Gestu Tweens is a Flutter package that provides widgets for creating simple and customizable animations such as scaling, opacity changes, and sliding transitions. The package includes three main widgets: `ScaleTween`, `OpacityTween`, and `TranslateTween`.

## Features

- **ScaleTween**: Animates the scale of a widget from a beginning value to an ending value.
- **OpacityTween**: Animates the opacity of a widget from a beginning value to an ending value.
- **TranslateTween**: Animates the position of a widget from a beginning offset to an ending offset.

## Getting Started

### Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  gestu_tweens: ^0.1.0
```

run `flutter pub get` to install the package.

## Usage

### ScaleTween

```dart
import 'package:gestu_tweens/gestu_tweens.dart';
import 'package:flutter/material.dart';

class ScaleTweenExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTween(
          child: Text('Scale me!'),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          begin: 0.5,
          end: 1.5,
          reverse: false,
        ),
      ),
    );
  }
}
```

### OpacityTween

```dart
import 'package:gestu_tweens/gestu_tweens.dart';
import 'package:flutter/material.dart';

class OpacityTweenExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpacityTween(
          child: Text('Fade me!'),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          begin: 0.2,
          end: 1.0,
          reverse: false,
        ),
      ),
    );
  }
}
```

### TranslateTween

```dart
import 'package:gestu_tweens/gestu_tweens.dart';
import 'package:flutter/material.dart';

class TranslateTweenExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TranslateTween(
          child: Text('Move me!'),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          begin: Offset(0, 30),
          end: Offset(0, 0),
          reverse: false,
        ),
      ),
    );
  }
}
```

