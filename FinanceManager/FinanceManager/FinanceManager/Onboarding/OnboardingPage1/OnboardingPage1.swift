import SwiftUI

struct OnboardingPage1: View {
    
    @State private var selectedCurrencyId: UUID? = nil
    @State private var countryCurrencies: [CountryCurrency] = (0..<20).map { index in
        CountryCurrency(id: UUID(), title: "Bangladeshi Taka \(index*index)", isSelected: false)
    }
    
    var body: some View {
        VStack {
            Text("Choose your currency sign")
                .fontWeight(.medium)
                .font(.title)
                .foregroundColor(.green)
                .padding(.horizontal)
                .padding(.top)
            
            
            ScrollView {
                VStack(alignment: .leading,spacing: 20) {
                    ForEach(countryCurrencies) { currency in
                        CurrencySelectionView(
                            title: currency.title,
                            isSelected: currency.id == selectedCurrencyId
                        )
                        .onTapGesture {
                            storeSystemSetting(key: AppKeyEnum.CURRENCEY_SIGN.rawValue, value: currency.title)
                            handleSelection(for: currency)
                        }
                    }
                }
            }
            .padding(.top, 20)
            .scrollIndicators(.hidden)
        }
    }
    
    private func storeSystemSetting(key: String , value : String ){
        let preferenceRepository = PreferenceRepositoryImpl()
        preferenceRepository.updateData(forKey: key, value: value)
    }
    
    
    private func handleSelection(for selectedCurrency: CountryCurrency) {
        selectedCurrencyId = selectedCurrency.id
        updateCurrenciesSelection()
    }
    
    private func updateCurrenciesSelection() {
        countryCurrencies = countryCurrencies.map { currency in
            var updatedCurrency = currency
            updatedCurrency.isSelected = currency.id == selectedCurrencyId
            return updatedCurrency
        }
    }
}




#Preview {
    OnboardingPage1()
}

struct CountryCurrency: Identifiable {
    let id: UUID
    var title: String
    var isSelected: Bool
}

struct CurrencySelectionView: View {
    
    var title: String
    var isSelected: Bool
    
    var body: some View {
        HStack (alignment:.center,spacing: 20){
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .foregroundColor(.green)
                .font(.system(size: 30))
            
            
            Text(title)
                .font(.headline)
                .fontWeight(.light)
        }
        .frame(alignment: .leading)
        
    }
}
