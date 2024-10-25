# nPhaseTestTask

## Overview

nPhaseTestTask is an iOS app for managing and displaying survey details, built with Swift, Objective-C using MVVM and the Coordinator pattern for a clean and scalable architecture.

## Requirements

- Xcode 14.0+
- iOS 14.0+
- Swift 5.0+
- Ruby (for CocoaPods)

## Dependencies

This project uses several CocoaPods dependencies to enhance functionality and streamline development:

- **ResearchKit**: Used for creating and managing survey tasks and steps, providing a robust framework for research study apps.
- **Realm**: Provides a local database solution for storing and querying survey data efficiently.
- **Mantle**: A model framework for Cocoa and Cocoa Touch that makes it easy to write simple, scalable model layers.

## Setup

### Ruby Environment

1. **Install Ruby**: Ensure you have Ruby installed. You can use a version manager like `rbenv` or `rvm`.

   - **Using rbenv**:
     ```bash
     brew install rbenv
     rbenv install 3.0.0
     rbenv global 3.0.0
     ```
     
   - **Using rvm**:
     ```bash
     \curl -sSL https://get.rvm.io | bash -s stable --ruby
     rvm install 3.0.0
     rvm use 3.0.0 --default
     ```

2. **Install CocoaPods**:
   ```bash
   gem install cocoapods
   ```

### Project Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/andr01d88/nPhaseTestTask.git
   cd nPhaseTestTask
   ```

2. **Install Dependencies**:
   ```bash
   pod install
   ```

## Architecture

- **MVVM**: Separates data (Model), UI (View), and presentation logic (ViewModel). Allowing testability in the same time being not complex for small-medium projects.
- **Coordinator**: Manages navigation flow, decoupling view controllers.

## Next steps
   - Add more tests. E.g. ViewModels
   - Add design system for fonts and colors (probably if we add more complex UI)
   - Add localisation 

## Contact

Andrew Koryagin [andrewko@gmx.com](mailto:andrewko@gmx.com).
