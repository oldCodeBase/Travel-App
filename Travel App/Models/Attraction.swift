//
//  Attraction.swift
//  Travel App
//
//  Created by Ibragim Akaev on 10/02/2021.
//

import Foundation

struct Attraction: Identifiable {
    
    let id = UUID().uuidString
    let name: String
    let imageName: String
    let latitude: Double
    let longitude: Double
}
