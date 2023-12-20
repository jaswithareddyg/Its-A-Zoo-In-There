# It's a Zoo in There

Welcome to "It's a Zoo in There" – an iPhone application that introduces you to a world of animals! This app is designed for iPhone 13, featuring a delightful combination of storyboard and programmatic interface design. Scroll through pages filled with animal images and information, tap buttons to hear their sounds, and enjoy a dynamic user experience.

## Project Overview

### Project Setup
- Use Xcode's iOS App template, selecting Swift for the language and Storyboard for the user interface.
- The application is designed exclusively for iPhone 13, with limited portrait device orientation.

### Sounds and Images
- 3 animal images are in the project's Asset Catalog, ensuring a single image for each resolution.
- 3 sound files are in a group named "Sounds" in the project.

### Model: Animal Class
- A custom class named `Animal` with properties: `name`, `species`, `age`, `image`, and `soundPath`.
- The class is conformed to the `CustomStringConvertible` protocol for easy debugging.

### View Controller
- An array property named `animals` on the default ViewController.

### Views
- A `UIScrollView` to the view controller in storyboard, representing 3 pages.

### Functionality
- Implemented a `buttonTapped(_ button: UIButton)` to display an alert with animal details.
- Play the associated sound when the user taps "Play Sound."

### UIScrollViewDelegate Extension
- Updated the UILabel's text and alpha as the user scrolls between pages.


### Notes
- Fading between pages is a work in progress.
- Currenlty the main file is in .zip format.

## Getting Started

1. Clone the repository.
2. Open the project in Xcode.
3. Run the app on an iPhone 13 simulator.

## Additional Information

- This project was developed using Xcode and Swift.
- For issues or questions, contact [(Jas) Jaswitha](mailto:jaswithareddyguntaka@gmail.com).

Enjoy exploring the zoo in the palm of your hands with "It's a Zoo in There"! 🐶🐈🐺
