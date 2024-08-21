import SwiftUI

struct ServiceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24, content: {
            ServiceFieldView(serviceText: "Видеоконсультация", serviceCost: 400)
            ServiceFieldView(serviceText: "Чат с врачом", serviceCost: 400)
            ServiceFieldView(serviceText: "Приём в клинике", serviceParameter: "В клинике", serviceCost: 400)
            Spacer()
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height)
        .background(.appLightGray)
    }
}

struct ServiceFieldView : View {
    var serviceText : String
    var serviceParameter : String = "40 мин"
    var serviceCost : Int
    var body: some View {
        VStack(alignment: .leading, spacing: 12, content: {
            Text(serviceText)
                .font(.custom(.bold, size: 16))
            HStack(content: {
                Text(serviceParameter)
                    .font(.custom(.regular, size: 16))
                Spacer()
                Text("от \(serviceCost) ₽")
                    .font(.custom(.bold, size: 16))
            })
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    ServiceView()
}
