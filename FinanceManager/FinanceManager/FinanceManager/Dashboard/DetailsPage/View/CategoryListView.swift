////
////  CategoryListView.swift
////  FinanceManager
////
////  Created by Mahedi Hassan Rabby on 30/9/24.
////
//
//import SwiftUI
//
//struct CategoryListView <T: CategoryProtocol & Identifiable > : View {
//    
//    var themeColor: Color
//    var categoryAddButtonTitle: String
//    var categoryIconName: String
//    var CategoryName: String
//    var CategorySelectedAction: (_ id: String) -> Void
//    @State var categories: [T] = []
//    
//    var body: some View {
//        VStack (alignment: .center, spacing: 10){
//                ScrollView {
//                    ForEach(categories){ category in
//                        HStack(spacing: 15) {
//                            CategoryItemView(iconName: category.iconName ?? "" , categoryName: category.categoryName??, "" , themeColor: category.iconColor ?? Color.CustomBlue , categoryTappedAction: self.CategoryTappedAction)
//                            CategoryItemView(iconName: category.iconName ?? "" , categoryName: category.categoryName ?? "" , themeColor: category.iconColor ?? Color.CustomBlue , categoryTappedAction: self.CategoryTappedAction)
//                        }
//                        .padding(.vertical,5)
//                        
//                    }
//                }
//                .scrollIndicators(.hidden)
//                
//                submitButton(buttonName: categoryAddButtonTitle, buttonColor : themeColor)
//            }
//            .padding(.all,20)
//            .onAppear{
//                categories = DataBase().getExpenseCategory()
//            }
//    }
//    
//    
//    func CategoryTappedAction(id: String){
//        CategorySelectedAction(id)
//    }
//}
//
//
////#Preview {
////    CategoryListView<<#T: Identifiable#>>(
////        themeColor: .green,
////        categoryAddButtonTitle: "Add category",
////        categoryIconName: "shopping-bag",
////        CategoryName: "Shopping",
////        CategorySelectedAction: { id in
////            print("Category selected with id: \(id)")
////        }
////    )
////}


//
//  CategoryListView.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 30/9/24.
//

import SwiftUI

struct CategoryListView<T: CategoryProtocol & Identifiable>: View {
    
    var themeColor: Color
    var categoryAddButtonTitle: String
    var categoryIconName: String
    var categoryName: String
    var categorySelectedAction: (_ name: String) -> Void
    var categoryType: CategoryTypeEnum
    @State var categories: [T] = []
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ScrollView {
                ForEach(categories) { category in
                    HStack(spacing: 15) {
                        CategoryItemView(
                            iconName: category.iconName ?? "",
                            categoryName: category.categoryName ?? "",
                            themeColor: category.iconColor ?? Color.blue,
                            categoryTappedAction: self.categoryTappedAction
                        )
                        CategoryItemView(
                            iconName: category.iconName ?? "",
                            categoryName: category.categoryName ?? "",
                            themeColor: category.iconColor ?? Color.blue,
                            categoryTappedAction: self.categoryTappedAction
                        )
                    }
                    .padding(.vertical, 5)
                }
            }
            .scrollIndicators(.hidden)
            
            submitButton(buttonName: categoryAddButtonTitle, buttonColor: themeColor)
        }
        .padding(.all, 20)
        .onAppear {
           // categories = DataBase().getExpenseCategory()
        }
    }
    
    func categoryTappedAction(name: String) {
        categorySelectedAction(name)
    }
}

//// Preview
//struct CategoryListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryListView<YourConcreteCategoryType>(
//            themeColor: .green,
//            categoryAddButtonTitle: "Add category",
//            categoryIconName: "shopping-bag",
//            categoryName: "Shopping",
//            categorySelectedAction: { id in
//                print("Category selected with id: \(id)")
//            }
//        )
//    }
//}
