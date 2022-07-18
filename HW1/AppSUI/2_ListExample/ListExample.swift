//
//  ListExample.swift
//  AppSUI
//
//  Created by Pavel ANIKIN on 14.06.2022.
//

import SwiftUI

struct Food: Identifiable {
    var name:String
    var isFavorite: Bool
    let id = UUID()
}

final class FoodListViewModel: ObservableObject {
    
    @Published private(set) var toogleFavTitle = "Switch Faves"
    
    @Published private(set) var foods = [
        Food(name: "🍏", isFavorite: true),
        Food(name: "🍕", isFavorite: false),
        Food(name: "🧄", isFavorite: true),
        Food(name: "🍔", isFavorite: false),
        Food(name: "🥑", isFavorite: true),
        Food(name: "🧀", isFavorite: true)
    ]
}

struct ListExample: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("List Example")
                FoodListView()
            }
        }
    }
}

struct FoodListView: View {
    
    @StateObject var viewModel: FoodListViewModel = .init()
    @State var favesShowd: Bool = false
    
    var body: some View {
        VStack {
            List{
                FoodFilterView(favesShowd: $favesShowd)
                    .environmentObject(viewModel)
                ForEach(viewModel.foods) { food in
                    if favesShowd || food.isFavorite {
                        NavigationLink(destination: FoodScreen(title: food.name)) {
                            Text(food.name)
                        }
                    }
                    
                }
            }
        }
    }// body
}

struct FoodFilterView: View {
    
    @EnvironmentObject var viewModel: FoodListViewModel
    @Binding var favesShowd: Bool
    
    var body: some View {
        Toggle(isOn: $favesShowd) {
            Text(viewModel.toogleFavTitle)
        }
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
