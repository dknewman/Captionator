# Captionator

An AI-powered iOS app that generates creative and factual captions for images using Apple's Vision framework.

## Features

- **📸 Image Upload**: Select images from your photo library
- **🤖 AI Caption Generation**: Generate creative or factual captions using Apple Vision
- **🎨 Modern UI**: Clean SwiftUI interface with gradient buttons and cards
- **📱 Image Management**: View, delete, and manage captioned images in a grid layout
- **⚡ Real-time Processing**: Live feedback with progress indicators during caption generation
- **🎯 Caption Types**: Choose between creative and factual caption styles

## Screenshots

The app features a modern interface with:
- Clean header with app title and processing indicator
- Caption type selector (Creative/Factual)
- Gradient "Add Image" button
- Grid layout for captioned images
- Empty state with helpful guidance

## Getting Started

### Prerequisites

- iOS 16.0+
- Xcode 15.0+
- Swift 5.9+

### Installation

1. Clone or download the project
2. Open `Captionator.xcodeproj` in Xcode
3. Build and run on iOS device or simulator
4. Grant photo library permissions when prompted

### Project Structure

```
Captionator/
├── Captionator.xcodeproj/          # Xcode project
├── Captionator/                    # Main app target
│   ├── CaptionatorApp.swift        # App entry point
│   ├── ContentView.swift           # Main view with grid layout
│   ├── CaptionatorViewModel.swift  # View model with business logic
│   ├── Models.swift                # Data models (CaptionedImage, CaptionType)
│   ├── CaptionedImageCard.swift    # Individual image card component
│   ├── FullScreenImageView.swift   # Full-screen image viewer
│   ├── Info.plist                  # App configuration
│   └── Assets.xcassets/            # App icons and colors
├── README.md                       # This file
└── PROJECT_OVERVIEW.md            # Detailed project documentation
```

## How It Works

1. **Image Selection**: Tap "Add Image" to select photos from your library
2. **Caption Type**: Choose between "Creative" or "Factual" caption styles
3. **AI Processing**: Apple's Vision framework analyzes the image locally on your device
4. **Caption Display**: Generated captions appear on beautiful image cards
5. **Management**: Tap and hold to delete images, or tap to view full-screen

## Technology Stack

- **SwiftUI**: Modern declarative UI framework
- **Vision Framework**: Apple's on-device computer vision API
- **PhotosUI**: Native photo picker integration
- **ObservableObject**: MVVM pattern with reactive state management
- **Swift Concurrency**: async/await patterns for image processing

## Privacy

All image processing happens locally on your device using Apple's Vision framework. No images or data are sent to external servers.

## License

This project is available under the MIT license.