import SwiftUI

extension Text {
    func setupDoctorCardText() -> some View {
        self.modifier(DoctorCardTextModifier())
    }
    
    func setupWriteButton() -> some View {
        self.modifier(ButtonModifier())
    }
}

struct DoctorCardTextModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(.medium, size: 20))
            .frame(width: 205, alignment: .leading)
    }
}

struct ButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(.appPink)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
    }
}

extension View {
    func setupImage() -> some View {
        self.modifier(ImageModifier())
    }
    
    func setupButton() -> some View {
        self.modifier(ButtonModifier())
    }
}

struct ImageModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}
