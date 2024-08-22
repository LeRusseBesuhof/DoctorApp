import SwiftUI

extension Text {
    func setupDoctorCardText() -> some View {
        self.modifier(DoctorCardTextModifier())
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
    var isEmpty : Bool
    func body(content: Content) -> some View {
        content
            .foregroundStyle(isEmpty ? .white : .black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(isEmpty ? .appPink : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
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

extension View {
    func setupImage() -> some View {
        self.modifier(ImageModifier())
    }
    
    func setupButton(_ isEmpty: Bool = true) -> some View {
        self.modifier(ButtonModifier(isEmpty: isEmpty))
    }
}
