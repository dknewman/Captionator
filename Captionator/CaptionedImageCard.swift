import SwiftUI

struct CaptionedImageCard: View {
    let captionedImage: CaptionedImage
    let onDelete: () -> Void

    @State private var showingFullScreen = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            imageView

            VStack(alignment: .leading, spacing: 6) {
                captionView
                statusView
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
        )
        .frame(maxWidth: .infinity)
        .frame(minHeight: 200, maxHeight: 280)
        .onTapGesture {
            showingFullScreen = true
        }
        .fullScreenCover(isPresented: $showingFullScreen) {
            FullScreenImageView(
                captionedImage: captionedImage,
                isPresented: $showingFullScreen,
                onDelete: onDelete
            )
        }
    }

    private var imageView: some View {
        Image(uiImage: captionedImage.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .clipped()
    }

    private var captionView: some View {
        Group {
            if let caption = captionedImage.caption, !caption.isEmpty {
                Text(caption)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                Text("Generating caption...")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .italic()
            }
        }
        .frame(minHeight: 30, maxHeight: 45, alignment: .top)
    }

    private var statusView: some View {
        HStack {
            statusIndicator

            Spacer()

            Text(captionedImage.createdAt, style: .time)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }

    private var statusIndicator: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(statusColor)
                .frame(width: 6, height: 6)

            Text(captionedImage.captionType.rawValue.capitalized)
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundColor(statusColor)
        }
    }

    private var statusColor: Color {
        switch captionedImage.captionType {
        case .pending:
            return .orange
        case .creative:
            return .purple
        case .factual:
            return .blue
        case .error:
            return .red
        }
    }
}