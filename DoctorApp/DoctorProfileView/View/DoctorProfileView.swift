import SwiftUI

struct DoctorProfileView: View {
    var profileImage : Image
    var docData : User?
    @State var isPricePagePushed : Bool = false
    
    init(_ profileImage: Image, _ docData: User?) {
        self.profileImage = profileImage
        self.docData = docData
    }
    
    var body: some View {
        if let docData {
            VStack(alignment: .leading, content: {
                VStack(alignment: .leading, spacing: 40, content: {
                    HStack(spacing: 16, content: {
                        profileImage
                            .resizable()
                            .setupImage()
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text(docData.lastName)
                                .font(.custom(.medium, size: 16))
                            Text("\(docData.firstName) \(docData.patronymic)")
                                .font(.custom(.medium, size: 16))
                        })
                    })
                    VStack(alignment: .leading, spacing: 13, content: {
                        InfoHStack(imageName: "clock", personText: "Опыт работы: \(docData.seniority) \(String.getSeniority(docData.seniority))")
                        
                        let category = docData.categoryLabel.rawValue
                        switch category {
                        case "нет": InfoHStack(imageName: "cross.case", personText: "Врач без категории")
                        default: InfoHStack(imageName: "cross.case", personText: "Врач: \(category) категория")
                        }
                        
                        if let higherEducation = docData.higherEducation.last?.specialization {
                            InfoHStack(imageName: "graduationcap", personText: higherEducation)
                        } else {
                            if let education = docData.educationTypeLabel?.name {
                                InfoHStack(imageName: "graduationcap", personText: education)
                            } else {
                                InfoHStack(imageName: "graduationcap", personText: "Нет образования")
                            }
                        }
                        
                        if let organization = docData.workExpirience.last?.organization {
                            InfoHStack(imageName: "mappin.and.ellipse", personText: organization)
                        } else {
                            InfoHStack(imageName: "mappin.and.ellipse", personText: "На данный момент без работы")
                        }
                    })
                    VStack(alignment: .leading, spacing: 44, content: {
                        HStack(content: {
                            Text("Стоимость услуг")
                                .font(.custom(.bold, size: 16))
                            Spacer()
                            Text("от \(docData.hospitalPrice) ₽")
                                .font(.custom(.bold, size: 16))
                        })
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                    })
                })
                .padding()
                .padding(.horizontal, 5)
                Spacer()
                Button("Записаться") {
                    isPricePagePushed.toggle()
                }
                .setupButton()
            })
            .navigationDestination(isPresented: $isPricePagePushed,
                                   destination: {
                ServiceView(
                    videoChatPrice: docData.videoChatPrice,
                    textChatPrice: docData.textChatPrice,
                    hospitalPrice: docData.hospitalPrice
                )
            })
            .navigationTitle("Педиатр")
            .navigationBarTitleDisplayMode(.inline)
            .background(.appLightGray)
        } else {
            EmptyView()
        }
    }
}

struct InfoHStack : View {
    var imageName : String
    var personText : String
    var body: some View {
        HStack(spacing: 12, content: {
            Image(systemName: imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 18, height: 18)
                .foregroundStyle(.gray)
            Text(personText)
                .font(.custom(.regular, size: 16))
                .foregroundStyle(.gray)
        })
    }
}
