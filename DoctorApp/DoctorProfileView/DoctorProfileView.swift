import SwiftUI

struct DoctorProfileView: View {
    var profileImage : Image
    var userData : User?
    
    init(_ profileImage: Image, _ userData: User?) {
        self.profileImage = profileImage
        self.userData = userData
    }
    
    var body: some View {
        if let userData {
            VStack(alignment: .leading, content: {
                VStack(alignment: .leading, spacing: 40, content: {
                    HStack(spacing: 16, content: {
                        profileImage
                            .resizable()
                            .setupImage()
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text(userData.lastName)
                                .font(.custom(.medium, size: 16))
                            Text("\(userData.firstName) \(userData.patronymic)")
                                .font(.custom(.medium, size: 16))
                        })
                    })
                    VStack(alignment: .leading, spacing: 13, content: {
                        InfoHStack(imageName: "clock", personText: "Опыт работы: \(userData.seniority) \(String.getSeniority(userData.seniority))")
                        
                        let category = userData.categoryLabel.rawValue
                        switch category {
                        case "нет": InfoHStack(imageName: "cross.case", personText: "Врач без категории")
                        default: InfoHStack(imageName: "cross.case", personText: "Врач: \(category) категория")
                        }
                        
                        if let higherEducation = userData.higherEducation.last?.specialization {
                            InfoHStack(imageName: "graduationcap", personText: higherEducation)
                        } else {
                            if let education = userData.educationTypeLabel?.name {
                                InfoHStack(imageName: "graduationcap", personText: education)
                            } else {
                                InfoHStack(imageName: "graduationcap", personText: "Нет образования")
                            }
                        }
                        
                        if let organization = userData.workExpirience.last?.organization {
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
                            Text("от \(userData.hospitalPrice) ₽")
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
                Text("Записаться")
                    .setupWriteButton()
            })
            .navigationTitle("Педиатры")
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
