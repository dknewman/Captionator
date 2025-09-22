import SwiftUI

struct FullScreenImageView: View {
    let captionedImage: CaptionedImage
    @Binding var isPresented: Bool
    let onDelete: () -> Void

    @State private var showingDeleteAlert = false

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                headerView

                Spacer()

                imageView

                Spacer()

                captionView
            }
        }
        .alert("Delete Image", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive) {
                onDelete()
                isPresented = false
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to delete this image and its caption?")
        }
    }

    private var headerView: some View {
        HStack {
            Button("Close") {
                isPresented = false
            }
            .foregroundColor(.white)

            Spacer()

            Button(action: {
                showingDeleteAlert = true
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.white)
            }
        }
        .padding()
    }

    private var imageView: some View {
        Image(uiImage: captionedImage.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
    }

    private var captionView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                statusIndicator
                Spacer()
                Text(captionedImage.createdAt, style: .relative)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }

            if let caption = captionedImage.caption, !caption.isEmpty {
                Text(caption)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            } else {
                Text("Generating caption...")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                    .italic()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
        .padding(.horizontal)
        .padding(.bottom, 40)
    }

    private var statusIndicator: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(statusColor)
                .frame(width: 8, height: 8)

            Text(captionedImage.captionType.rawValue.capitalized)
                .font(.caption)
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