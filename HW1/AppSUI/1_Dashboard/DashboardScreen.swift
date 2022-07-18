//
//  Dashboard.swift
//  AppSUI
//
//  Created by Pavel ANIKIN on 05.06.2022.
//

import SwiftUI


final class DashboardViewModel: ObservableObject {
    
    @Published var promos: [Int] = Array<Int>(0...20)
    
    init() {
        
    }
    
}

struct DashboardScreen: View {
    
    
    //    @ObservedObject var dashboardViewModel: DashboardViewModel = .init()
    //    @StateObject var dashboardViewModel: DashboardViewModel = .init()
    @ObservedObject var foodViewModel: FoodListViewModel = .init()
    @State var showModal: Bool = false
    @State var title: String = "List Example"
    
    var body: some View {
                
            NavigationView {
                VStack {
                    Text("Dashboard")
                    PromosView()
                    
                    NavigationLink(destination: ListExample()) {
                        Text("List Example")
                            .font(.largeTitle)
                            .padding(15)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: FoodScreen(title: foodViewModel.foods[0].name )) {
                        Text("Open "+foodViewModel.foods[0].name)
                            .font(.largeTitle)
                            .padding(15)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }// VStack
            }
    }// body
}

struct PromosView: View {
    
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                ForEach(dashboardViewModel.promos, id: \.self) { item in
                    Text("\(item)")
                        .frame(width: 100, height: 100)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(5)
                }
            }
        }
        .padding()
    } //body
    
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
