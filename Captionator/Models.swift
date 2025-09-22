import Foundation
import UIKit

struct CaptionedImage: Identifiable, Equatable {
    let id: UUID
    let image: UIImage
    let caption: String?
    let createdAt: Date
    let captionType: CaptionType

    init(
        id: UUID = UUID(),
        image: UIImage,
        caption: String? = nil,
        createdAt: Date = Date(),
        captionType: CaptionType = .pending
    ) {
        self.id = id
        self.image = image
        self.caption = caption
        self.createdAt = createdAt
        self.captionType = captionType
    }

    static func == (lhs: CaptionedImage, rhs: CaptionedImage) -> Bool {
        lhs.id == rhs.id
    }
}

enum CaptionType: String, CaseIterable {
    case pending
    case creative
    case factual
    case error
}