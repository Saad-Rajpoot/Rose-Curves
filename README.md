# Rose Curves in Flutter

Welcome to the Rose Curves Flutter project! This project showcases how to create beautiful and interactive rose curves using Flutter's powerful drawing capabilities. Whether you're a seasoned developer or just starting, this project offers a fun and educational way to explore Flutter's custom painting and UI design features.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage](#usage)
    - [Adjusting Parameters](#adjusting-parameters)
- [Code Overview](#code-overview)
    - [Main Widgets](#main-widgets)
    - [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

Rose curves, also known as rhodonea curves, are a family of mathematical curves that produce beautiful, flower-like patterns. These curves are defined by a simple polar equation but result in stunning and intricate designs. This Flutter project recreates the experience, allowing users to generate and manipulate these fascinating patterns through an intuitive mobile interface.

## Features

- **Interactive UI:** Modify parameters in real-time to transform and explore various rose curve patterns.
- **Customizable Designs:** Adjust the number of petals, curve density, and other variables to create unique patterns.
- **Responsive Layout:** The app seamlessly adapts to different screen sizes and orientations for a consistent and engaging experience.
- **Smooth Animations:** Experience fluid transitions as you tweak parameters and watch the rose curves evolve instantly.
- **Educational Value:** An excellent tool for learning about mathematical curves and their geometric properties.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/rose-curves-flutter.git
    cd rose-curves-flutter
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

After running the app, you will see a rose curve pattern displayed on the screen. Use the slider at the bottom to adjust the parameters and explore different designs.

### Adjusting Parameters

- **Number of Petals (k):** Controls the number of petals in the rose curve.
- **Curve Density:** Adjusts the density of the curve lines.

## Code Overview

### Main Widgets

- **RoseCurvesDemo:** This is the main widget containing the UI elements, including the slider and the CustomPaint widget.
- **RoseCurvesPainter:** A custom painter class responsible for drawing the rose curves on the canvas.

Here is an example of the `RoseCurvesPainter` class:

```dart
class RoseCurvesPainter extends CustomPainter {
  final double t;
  final int k;

  RoseCurvesPainter({required this.t, required this.k});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (double theta = 0.0; theta < 2 * pi; theta += 0.01) {
      final r = cos(k * theta);
      final x = r * cos(theta);
      final y = r * sin(theta);

      if (theta == 0.0) {
        path.moveTo(size.width / 2 + x * size.width / 2, size.height / 2 + y * size.height / 2);
      } else {
        path.lineTo(size.width / 2 + x * size.width / 2, size.height / 2 + y * size.height / 2);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RoseCurvesPainter oldDelegate) {
    return oldDelegate.t != t || oldDelegate.k != k;
  }
}
```

### Customization

You can modify the `RoseCurvesPainter` class to change how the rose curves are drawn. Adjust the parameters like `k` to see different patterns. Here's how you might do it:

```dart
class RoseCurvesPainter extends CustomPainter {
  final double t;
  final int k;

  RoseCurvesPainter({required this.t, required this.k});

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing logic
  }

  @override
  bool shouldRepaint(RoseCurvesPainter oldDelegate) {
    return oldDelegate.t != t || oldDelegate.k != k;
  }
}
```

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to reach out:

- Email: saadi47123@gmail.com
- GitHub: [Saad-Rajpoot](https://github.com/Saad-Rajpoot)
- LinkedIn: [Saad Rajpoot](https://www.linkedin.com/in/saad-rajpoot-b3ba85225/)

Thank you for checking out the Rose Curves Flutter project! Enjoy creating your own unique patterns and feel free to share your creations with the community.