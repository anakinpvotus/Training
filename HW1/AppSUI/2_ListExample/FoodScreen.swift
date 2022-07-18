//
//  FoodScreen.swift
//  AppSUI
//
//  Created by Pavel ANIKIN on 13.06.2022.
//

import SwiftUI

struct FoodScreen: View {

    var title: String
        
    var body: some View {
        VStack {
            
            EmptyView()
            Text(title)
                .font(.system(size: 350))
        }
        .navigationTitle(title)
        
        
    }// body
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen(title: "🥨")
    }
}
