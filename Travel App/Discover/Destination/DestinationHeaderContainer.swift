//
//  DestinationHeaderContainer.swift
//  Travel App
//
//  Created by Ibragim Akaev on 10/02/2021.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    let imageNames: [String]
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CustomPageViewController(imageNames: imageNames)
        return pvc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer(imageNames: ["eiffel_tower", "japan", "new_york"])
    }
}
