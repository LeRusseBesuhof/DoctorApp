import SwiftUI

struct ServiceView: View {
    var videoChatPrice : Int
    var textChatPrice : Int
    var hospitalPrice : Int
    var body: some View {
        VStack(alignment: .leading, spacing: 24, content: {
            ServiceFieldView(serviceText: "Видеоконсультация", servicePrice: videoChatPrice)
            ServiceFieldView(serviceText: "Чат с врачом", servicePrice: textChatPrice)
            ServiceFieldView(serviceText: "Приём в клинике", serviceParameter: "В клинике", servicePrice: hospitalPrice)
            Spacer()
        })
        .navigationTitle("Стоимость услуг")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height)
        .background(.appLightGray)
    }
}

struct ServiceFieldView : View {
    var serviceText : String
    var serviceParameter : String = "40 мин"
    var servicePrice : Int
    var body: some View {
        VStack(alignment: .leading, spacing: 12, content: {
            Text(serviceText)
                .font(.custom(.bold, size: 16))
            HStack(content: {
                Text(serviceParameter)
                    .font(.custom(.regular, size: 16))
                Spacer()
                Text("от \(servicePrice) ₽")
                    .font(.custom(.bold, size: 16))
            })
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}
