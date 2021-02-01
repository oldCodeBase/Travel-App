//
//  DiscoverCategoriesView.swift
//  Travel App
//
//  Created by Ibragim Akaev on 28/01/2021.
//

import SwiftUI

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
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
                            VStack(spacing: 8) {
                                Image(systemName: category.imageName)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5059075952, blue: 0.2313886285, alpha: 1)))
                                    .frame(width: 64, height: 64)
                                    .background(Color.white)
                                    .cornerRadius(64)
                                Text(category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }.frame(width: 68)
                        })
                }
            }.padding(.horizontal)
        }
    }
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Int]()
    
    init() {
        // network
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
            self.places = [1, 2, 3, 4, 5]
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
    typealias UIViewType = UIActivityIndicatorView
}

struct CategoryDetailsView: View {
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }.padding()
                .background(Color.black)
                .cornerRadius(8)
                
            } else {
                ScrollView {
                    ForEach(vm.places, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 0) {
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("Category")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                            
                        }.asTile()
                        .padding()
                    }
                }
            }
        }.navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
        DiscoverView()
    }
}
