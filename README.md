# Captionator

An AI-powered iOS app for generating creative and factual captions for images using Apple's Vision framework.

## Features

- **Image Upload**: Select images from photo library
- **AI Caption Generation**: Generate creative or factual captions using Apple Vision
- **Modern UI**: Clean, sleek SwiftUI interface
- **Image Management**: View, delete, and manage captioned images
- **Real-time Processing**: Live feedback during caption generation

## Architecture

This project follows a modular architecture with clean separation of concerns:

### Modules

- **CaptionatorCore**: Core models and protocols
- **CaptionatorServices**: Business logic and repository implementations
- **CaptionatorUI**: SwiftUI views and components

### Design Patterns

- **Repository Pattern**: Abstracted data access layer
- **MVVM**: View models manage UI state
- **Dependency Injection**: Testable and modular components

## Getting Started

### Prerequisites

- iOS 16.0+
- Xcode 15.0+
- Swift 5.9+

### Installation

1. Clone or download the project
2. Open in Xcode
3. Build and run on iOS device or simulator

### Project Structure

```
Captionator/
├── Sources/
│   ├── CaptionatorCore/         # Core models and protocols
│   │   ├── Models/
│   │   └── Protocols/
│   ├── CaptionatorServices/     # Business logic layer
│   │   ├── VisionCaptionService.swift
│   │   ├── InMemoryCaptionRepository.swift
│   │   └── CaptionatorManager.swift
│   └── CaptionatorUI/           # SwiftUI interface
│       ├── Views/
│       └── Components/
├── Tests/                       # Unit tests
├── CaptionatorApp/             # App entry point
└── Package.swift               # Swift Package Manager
```

## Testing

The project includes comprehensive unit tests following TDD principles:

```bash
# Run tests in Xcode
cmd + U

# Or use Swift Package Manager
swift test
```

## Technology Stack

- **SwiftUI**: Modern declarative UI framework
- **Vision Framework**: Apple's computer vision API
- **Combine**: Reactive programming
- **Swift Concurrency**: async/await patterns
- **XCTest**: Unit testing framework

## License

This project is available under the MIT license.