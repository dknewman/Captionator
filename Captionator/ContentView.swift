import SwiftUI
import PhotosUI
import Vision

struct ContentView: View {
    @StateObject private var viewModel = CaptionatorViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                headerView

                if viewModel.captionedImages.isEmpty && !viewModel.isProcessing {
                    emptyStateView
                } else {
                    imageGridView
                }
            }
            .navigationBarHidden(true)
            .photosPicker(
                isPresented: $viewModel.showingImagePicker,
                selection: $viewModel.selectedPhoto,
                matching: .images
            )
            .onChange(of: viewModel.selectedPhoto) { newPhoto in
                if let newPhoto = newPhoto {
                    viewModel.processSelectedPhoto(newPhoto)
                }
            }
        }
        .onAppear {
            viewModel.loadImages()
        }
    }

    private var headerView: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Captionator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Spacer()

                if viewModel.isProcessing {
                    ProgressView()
                        .scaleEffect(0.8)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)

            captionTypeSelector

            addImageButton
        }
        .padding(.bottom, 20)
        .background(Color(.systemBackground))
    }

    private var captionTypeSelector: some View {
        HStack(spacing: 12) {
            ForEach(CaptionType.allCases.filter { $0 != .pending && $0 != .error }, id: \.self) { type in
                Button(action: {
                    viewModel.selectedCaptionType = type
                }) {
                    Text(type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(viewModel.selectedCaptionType == type ? Color.blue : Color(.systemGray5))
                        )
                        .foregroundColor(viewModel.selectedCaptionType == type ? .white : .primary)
                }
            }
        }
        .padding(.horizontal, 24)
    }

    private var addImageButton: some View {
        Button(action: {
            viewModel.showingImagePicker = true
        }) {
            HStack(spacing: 8) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                Text("Add Image")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
            )
        }
        .disabled(viewModel.isProcessing)
        .opacity(viewModel.isProcessing ? 0.6 : 1.0)
        .padding(.horizontal, 24)
    }

    private var emptyStateView: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "photo.on.rectangle.angled")
                .font(.system(size: 80))
                .foregroundColor(.gray)

            VStack(spacing: 8) {
                Text("No Images Yet")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Upload an image to get started with AI-powered captions")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
        .padding(.horizontal, 40)
    }

    private var imageGridView: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 20),
                GridItem(.flexible(), spacing: 20)
            ], spacing: 24) {
                ForEach(viewModel.captionedImages) { image in
                    CaptionedImageCard(
                        captionedImage: image,
                        onDelete: {
                            viewModel.deleteImage(image)
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .aspectRatio(0.75, contentMode: .fit)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    ContentView()
}