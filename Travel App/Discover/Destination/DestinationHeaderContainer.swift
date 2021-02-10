//
//  DestinationHeaderContainer.swift
//  Travel App
//
//  Created by Ibragim Akaev on 10/02/2021.
//

import SwiftUI


struct DestinationHeaderContainer: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .systemRed
        return redVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
    }
}
