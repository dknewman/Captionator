# Captionator App Icons

This directory contains the complete set of app icons for the Captionator iOS app.

## Design

The app icon features a modern, flat design that represents the core functionality of the app:

- **📸 Photo Frame**: Represents image input with a scenic landscape
- **💬 Speech Bubble**: Represents AI-generated captions
- **✨ AI Sparkles**: Indicates AI/machine learning processing
- **🔗 Connection Line**: Shows the relationship between image and caption

### Design Elements

- **Color Scheme**: Purple-to-blue gradient background with clean white and cyan accents
- **Style**: Flat design with subtle gradients and shadows
- **Visual Metaphor**: Clear representation of "image captioning" concept

## Files Generated

### Source Files
- `app-icon.svg` - Original vector source (1024×1024)
- `generate-icons.sh` - Script to generate all required sizes

### iOS App Icon Sizes
- `app-icon-20x20.png` - iPhone Notification (iOS 7-15, 2x)
- `app-icon-29x29.png` - iPhone Spotlight/Settings (iOS 7-15, 2x)
- `app-icon-40x40.png` - iPhone Spotlight (iOS 7-15, 2x)
- `app-icon-58x58.png` - iPhone Spotlight/Settings (iOS 7-15, 2x)
- `app-icon-60x60.png` - iPhone App (iOS 7-15, 2x)
- `app-icon-76x76.png` - iPad App (iOS 7-15, 1x)
- `app-icon-80x80.png` - iPhone Spotlight (iOS 7-15, 3x)
- `app-icon-87x87.png` - iPhone App (iOS 7-15, 3x)
- `app-icon-120x120.png` - iPhone App (iOS 7-15, 2x)
- `app-icon-152x152.png` - iPad App (iOS 7-15, 2x)
- `app-icon-167x167.png` - iPad Pro App (iOS 9-15, 2x)
- `app-icon-180x180.png` - iPhone App (iOS 7-15, 3x)
- `app-icon-1024x1024.png` - App Store (iOS 7-15, 1x)

## Implementation

To use these icons in your Xcode project:

1. Open your Xcode project
2. Navigate to the `Assets.xcassets` folder
3. Select the `AppIcon` asset
4. Drag and drop the appropriate PNG files to their corresponding slots
5. The naming convention matches the required sizes in the AppIcon asset catalog

## Regenerating Icons

If you need to modify the icon design:

1. Edit the `app-icon.svg` file
2. Convert to PNG: `qlmanage -t -s 1024 -o . app-icon.svg`
3. Rename: `mv app-icon.svg.png app-icon-1024x1024.png`
4. Run: `./generate-icons.sh` to create all required sizes

## Design Guidelines

The icon follows Apple's Human Interface Guidelines:
- ✅ Simple and recognizable design
- ✅ Appropriate use of color and contrast
- ✅ Scales well at all sizes
- ✅ No text or words
- ✅ Consistent visual style with the app
- ✅ Unique and memorable