import SwiftUI

extension View {
    func convertDataToImage(_ data: Data) -> Image {
        if let convertedUIImage = UIImage(data: data) {
            return Image(uiImage: convertedUIImage)
        } else {
            return Image(.default)
        }
    }
}
