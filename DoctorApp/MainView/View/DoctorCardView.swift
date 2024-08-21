import SwiftUI

struct DoctorCardView: View {
    let docData : User
    @State private var currentProfileImage : Image!
    @State private var isFavorite : Bool = false
    @Binding var chosenDoctor : User?
    @Binding var profileImage : Image?
    @Binding var isPushed : Bool
    
    var body: some View {
        VStack(content: {
            HStack(alignment: .top, content: {
                if let urlString = docData.avatar {
                    AsyncImage(url: URL(string: urlString)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .setupImage()
                                .onAppear {
                                    currentProfileImage = image
                                }
                        case .failure(_):
                            Text("Error loading image")
                        @unknown default:
                            fatalError()
                        }
                    }
                } else {
                    Image(.default)
                        .resizable()
                        .setupImage()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 12, content: {
                    VStack(spacing: 3, content: {
                        Text(docData.lastName)
                            .setupDoctorCardText()
                        Text("\(docData.firstName) \(docData.patronymic)" )
                            .setupDoctorCardText()
                    })
                    HStack(content: {
                        ForEach(0..<5) { ind in
                            if ind < docData.rank {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.appPink)
                            } else {
                                Image(systemName: "star")
                                    .foregroundStyle(.gray)
                            }
                        }
                    })
                    // TODO: make correct experience
                    Text("\(getSpecialization(docData.specialization)) \u{00B7} стаж \(docData.seniority) \(String.getSeniority(docData.seniority))")
                        .frame(width: 205, alignment: .leading)
                        .font(.custom(.regular, size: 20))
                        .foregroundStyle(.appDarkGray)
                    Text("от \(docData.hospitalPrice) ₽")
                        .font(.custom(.medium, size: 20))
                })
                Spacer()
                Button(action: {
                    isFavorite.toggle()
                }, label: {
                    if isFavorite {
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
                chosenDoctor = docData
                profileImage = currentProfileImage
                isPushed.toggle()
            }
            .setupButton()
        })
        .frame(maxWidth: .infinity)
        .background(.appLightGray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
    
    func getSpecialization(_ specArray: [Specialization]) -> String {
        guard !specArray.isEmpty else {
            return "Врач"
        }
        var specialization = String()
        for spec in specArray {
            specialization += "\(spec.name)\n"
        }
        specialization.removeLast(2)
        return specialization
    }
}
