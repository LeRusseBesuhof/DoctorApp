import SwiftUI

struct DoctorCardView: View {
    @State private var isFavourite : Bool = false
    var body: some View {
        VStack(content: {
            HStack(alignment: .top, content: {
                Image(.default)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFill()
                    .clipShape(Circle())
                Spacer()
                VStack(alignment: .leading, spacing: 12, content: {
                    VStack(content: {
                        Text("last name")
                            .setup()
                        Text("first name + patronymic")
                            .setup()
                    })
                    HStack(content: {
                        ForEach(0..<5) { ind in
                            if ind < 3 {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.appPink)
                            } else {
                                Image(systemName: "star")
                                    .foregroundStyle(.gray)
                            }
                        }
                    })
                    Text("profession \u{00B7} years")
                        .frame(width: 205, alignment: .leading)
                        .font(.custom(.regular, size: 20))
                        .foregroundStyle(.appDarkGray)
                    Text("от 600p")
                        .font(.custom(.medium, size: 20))
                })
                Spacer()
                Button(action: {
                    isFavourite.toggle()
                }, label: {
                    if isFavourite {
                        Image(systemName: "heart.fill")
                            .tint(.appPink)
                    } else {
                        Image(systemName: "heart")
                            .tint(.gray)
                    }
                })
                
            })
            .padding(.top)
            .padding(.horizontal)
            Button("Записаться") {
                //
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(.appPink)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        })
        .frame(maxWidth: .infinity)
        .background(.appLightGray)
        .padding()
    }
}

#Preview {
    DoctorCardView()
}

extension Text {
    func setup() -> some View {
        self.modifier(TextModifier())
    }
}

struct TextModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(.medium, size: 20))
            .frame(width: 205, alignment: .leading)
    }
}
