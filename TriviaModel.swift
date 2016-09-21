//
//  TriviaModel.swift
//  CartoonTrivia
//
//  Created by Grace Lam on 7/23/14.
//  Copyright (c) 2014 Grace Lam. All rights reserved.
//

import Foundation

class TriviaModel {
    
    var score:Int = 0
    var currentCartoon:String = "Mike Wazowski"
    var cartoons:[String] = []
    var images:[String] = []
    
    
    init() {
        self.addCartoon("Mike Wazowski", image: "mike.jpg")
        self.addCartoon("Olaf", image: "olaf.jpg")
        self.addCartoon("Tigger", image: "tigger.jpg")
        self.addCartoon("Mickey Mouse", image: "mickey.jpg")
    }
    
    func getScore() -> Int {
        return score
    }
    
    func addCartoon(cartoon:String, image:String) {
        cartoons += cartoon
        images += image
    }
    
    func getRandomCartoon() -> String {
        var random:Int = Int(arc4random_uniform(UInt32(cartoons.count)))
        currentCartoon = cartoons[random]
        return cartoons[random]
    }
    
    func getImageForCartoon(cartoon:String) -> String {
        for index in 0...cartoons.count {
            if cartoons[index] == cartoon {
                return images[index]
            }
        }
        return ""
    }
    
    func guess(cartoon:String) -> Bool {
        if currentCartoon == cartoon {
            score++
            return true
        }
        return false
    }
    
}