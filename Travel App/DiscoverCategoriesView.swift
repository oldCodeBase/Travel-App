//
//  DiscoverCategoriesView.swift
//  Travel App
//
//  Created by Ibragim Akaev on 28/01/2021.
//

import SwiftUI

struct Category: Hashable {
    let name, imageName: String
}

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        Category(name: "Art", imageName: "paintpalette.fill"),
        Category(name: "Sport", imageName: "sportscourt.fill"),
        Category(name: "Live Events", imageName: "music.mic"),
        Category(name: "Food", imageName: "tray.fill"),
        Category(name: "History", imageName: "books.vertical.fill"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8) {
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                            .frame(width: 64, height: 64)
                            .background(Color(.white))
                            .cornerRadius(32)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        }
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCategoriesView()
            .background(Color(.black))
    }
}
