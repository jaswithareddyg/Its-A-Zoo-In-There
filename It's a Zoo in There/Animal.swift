//
//  Animal.swift
//  It's a Zoo in There
//
//  Created by Jaswitha Reddy Guntaka on 1/14/23.
//

import Foundation
import UIKit

class Animal: CustomStringConvertible {
    let name: String
    let species: String
    let age: Int
    var image: UIImage
    let soundPath: String
    var description: String {
        return "This is \(name). \(name) is a \(species) and its age is \(age)."
    }
    
    init(name: String, species: String, age: Int, image: UIImage, soundPath: String){
        self.name = name
        self.species = species
        self.age = age
        self.image = image
        self.soundPath = soundPath
    }
}

