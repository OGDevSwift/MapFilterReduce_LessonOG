//
//  Model .swift
//  MapFilterReduce
//
//  Created by Anatoliy Mamchenko on 10.03.2021.
//

import Foundation

struct RickAndMortyHeroModel: RickAndMortyModelProtocol  {
    var name: String
    var age: Int
    var imageName: String
    var powerPoint: Int
}

struct RickAndMortyEnemyModel: RickAndMortyModelProtocol {
    var name: String
    var age: Int
    var imageName: String
    var powerPoint: Int
    
}


protocol RickAndMortyModelProtocol {
    var name: String {get}
    var age: Int {get}
    var imageName: String {get}
    var powerPoint: Int {get}
}
