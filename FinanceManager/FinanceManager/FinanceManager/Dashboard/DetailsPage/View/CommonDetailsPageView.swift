//
//  CommonDetailsPageView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 28/9/24.
//

import SwiftUI
import PhotosUI


struct CommonDetailsPageView: View {
    
    var istoogleOn: Bool = false
    
    
    @ObservedObject var viewmodel : CommonDetailsPageViewModel
    
    var body: some View {
        
        ZStack {
            
            viewmodel.themeColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 0){
                DetailsPageNavigationBar( pageTitle: viewmodel.pageTitle)
                
                Spacer()
                amountInputview(amount: $viewmodel.amount)
                
                DetailsPageInformationView(category: viewmodel.category, description: viewmodel.description, wallet: viewmodel.wallet, istoggleOn: istoogleOn, themeColor: utilityFunction().getThemeColor(pageType: viewmodel.pageType), addCategoryButtonTitle: "Add \(viewmodel.pageTitle) Category", pageType: viewmodel.pageType)
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            viewmodel.themeColor = utilityFunction().getThemeColor(pageType: viewmodel.pageType)
            viewmodel.pageTitle = viewmodel.pageType.rawValue
        }
    }
}

//#Preview {
//    CommonDetailsPageView(amount: "", category: "", description: "", wallet: "", themeColor: .CustomRed,istoogleOn: true, pageType: .EXPENSE)
//}

struct DetailsPageNavigationBar: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var pageTitle: String
    
    
    var body: some View {
        HStack (alignment: .center,spacing: 20){
            Image("arrow-left")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .padding(.leading,15)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            
            Spacer()
            
            Text(pageTitle)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
            
            Image("arrow-left2")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .padding(.trailing,15)
        }
        .padding(.top,5)
    }
}

struct amountInputview: View {
    
    @Binding var amount: String
    
    var body: some View {
        VStack (alignment: .leading,spacing: 5){
            Text("How much?")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(.white.opacity(0.95))
            
            TextField(text: $amount, label: {
                Text("Enter amount..")
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .foregroundColor(Color.white.opacity(0.5))
                    .underline()
            })
            .foregroundColor(.white)
            .font(.system(size: 40))
            .fontWeight(.bold)
            .keyboardType(.decimalPad)
        }
        .padding(.leading,20)
        .padding(.top,50)
    }
}

struct DetailsPageInformationView: View {
    
    @State var category : String
    @State var description : String
    @State var wallet : String
    @State var showCategoryBottomSheet: Bool = false
    @State var showWalletTypeBottomSheet: Bool = false
    @State var isExpsenCategoryTapped: Bool = false
    @State var iswalletTapped: Bool = false
    @State var istoggleOn: Bool
    @State var isDescriptionTapped: Bool = false
    var themeColor: Color
    var addCategoryButtonTitle : String
    var pageType : DetailsPageEnum
    
    
    
    
    @State var selectedExpenseCategory : String?
    @State var selectedWalletCategory : String?
    
    
    var body: some View {
        
        ZStack {
            Color.white
            
            ScrollView {
                VStack (spacing: 20){
                    IndividualCellView(fieldName: "Select Category", iconName: "dropDown", textFieldvalue: $category, isCellTapped: $showCategoryBottomSheet, selectedCategory: $selectedExpenseCategory)
                        .onTapGesture {
                            showCategoryBottomSheet.toggle()
                            isExpsenCategoryTapped = true
                            isDescriptionTapped = false
                            print("showCategorybottomsheet flag \(showCategoryBottomSheet)")
                        }
                        .sheet(isPresented: $showCategoryBottomSheet) {
                            CategoryListView(themeColor: themeColor, categoryAddButtonTitle: addCategoryButtonTitle,categoryIconName: "shopping-bag", categoryName: "Shopping", categorySelectedAction: self.CategorySelected, categoryType: .EXPENSE_CATEGORY, categories: DataBase().getExpenseCategory())
                                .presentationDetents([.fraction(0.35),.fraction(0.6)])
                        }
                    
                    if pageType != .MONEY_TRANSFER {
                        IndividualCellView(fieldName: "Wallet", iconName: "dropDown", textFieldvalue: $wallet, isCellTapped: $showWalletTypeBottomSheet, selectedCategory: $selectedWalletCategory)
                            .onTapGesture {
                                showWalletTypeBottomSheet.toggle()
                                isDescriptionTapped = false
                                print("showWalletTypebottomSheet flag \(showWalletTypeBottomSheet)")
                            }
                            .sheet(isPresented: $showWalletTypeBottomSheet) {
                                CategoryListView(themeColor: themeColor, categoryAddButtonTitle: addCategoryButtonTitle,categoryIconName: "shopping-bag", categoryName: "Shopping", categorySelectedAction: self.WalletSelected, categoryType: .WALLET_CATEGORY, categories: DataBase().getWalletType())
                                    .presentationDetents([.fraction(0.35),.fraction(0.6)])
                            }
                    }
                    IndividualCellView(fieldName: "Description", iconName: "textField", textFieldvalue: $description, isCellTapped: $isDescriptionTapped, selectedCategory: $selectedExpenseCategory)
                        .onTapGesture {
                            isDescriptionTapped = true
                        }
                    
                    addAttachmentViewCell()
                    
//                    if pageType != .MONEY_TRANSFER {
//                        ToogleButtonCell(istoogleOn: istoggleOn, title: "Repeat", subtitle: "Repeat transaction")
//                    }
                    
                    
                    submitButton(buttonName: "Continue", buttonColor: themeColor)
                    Spacer()
                }
                .padding(.top,20)
            }
            
            
        }
        .cornerRadius(40)
        .ignoresSafeArea()
        .padding(.top,50)
        .frame(width: .infinity)
        .padding(.bottom,0)
    }
    
    func CategorySelected(name: String){
        showCategoryBottomSheet = false
        isExpsenCategoryTapped = false
        selectedExpenseCategory = name
    }
    
    func WalletSelected(name: String){
        showWalletTypeBottomSheet = false
        selectedWalletCategory = name
    }
    
}


struct IndividualCellView: View {
    
    var fieldName: String
    var iconName: String
    @Binding var textFieldvalue: String
    @Binding var isCellTapped : Bool
    @Binding var selectedCategory: String?
    
    
    
    var body: some View {
        HStack{
            
            
            if iconName == "dropDown" {
                
                if let category = selectedCategory {
                    Text(category)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                } else {
                    Text(fieldName)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                
                
            } else {
                TextField(text:$textFieldvalue, label: {
                    Text(fieldName)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                })
                .font(.subheadline)
                .fontWeight(.regular)
//                .foregroundColor(.black)
                .keyboardType(.asciiCapable)
            }
            
            //
            Spacer()
            
            Image(iconName)
                .resizable()
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
                .aspectRatio(contentMode: .fit)
                .fontWeight(.bold)
                .frame(width: 20, height: 20)
        }
        .padding(.all,15)
        .background(
            RoundedRectangle(cornerRadius: 15).stroke(isCellTapped ? Color.black : Color.gray.opacity(0.5),lineWidth: 1)
        )
        .padding(.horizontal)
    }
}



@MainActor
final class photosPickerViewModel  : ObservableObject{
    @Published private(set) var selectedImage : UIImage? = nil
    @Published var isHiddenSelectedImage = false
    @Published var imageSelection: PhotosPickerItem? = nil{
        
        didSet{
            setImage(from: imageSelection)
        }
    }
    private func setImage(from selection: PhotosPickerItem?){
        guard let selection else {return }
        
        Task {
            do {
                let data = try await selection.loadTransferable(type: Data.self)
                guard let data, let uiImage = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                selectedImage = uiImage
                isHiddenSelectedImage = true
            } catch{
                print(error)
            }
            
        }
    }
}




struct addAttachmentViewCell : View {
    
    
    @StateObject private var viewModel = photosPickerViewModel()
    
    
    var body: some View {
        
        
        VStack (spacing: 0){
            
            PhotosPicker(selection: $viewModel.imageSelection , matching: .images){
                
                HStack(alignment: .center,spacing:10){
                    
                    Image("attachment")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .fontWeight(.bold)
                        .frame(width: 20, height: 20)
                    
                    Text("Add attachment")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.all,15)
                .background(
                    RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.5),lineWidth: 1)
                )
                .padding(.horizontal,15)
            }
            
            
            if viewModel.isHiddenSelectedImage {
                HStack (spacing: 10){
                    
                    ZStack (alignment:.topTrailing){
                        Image(uiImage: viewModel.selectedImage ?? UIImage(named: "attachment")!)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.5),lineWidth: 1.5)
                            )
                            .padding(.top,10)
                            .padding(.trailing,10)
                        
                        
                        Image("close")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .background(
                                Color.gray
                            )
                            .clipShape(Circle())
                            .onTapGesture {
                                viewModel.isHiddenSelectedImage = false
                            }
                        
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal,15)
            }
            
            
        }
        
        
    }
    
}








struct BottomSheetView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            if isShowing {
                VStack {
                    Text("Hello sheet!")
                }
                .frame(maxWidth: .infinity)
                .background(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}


