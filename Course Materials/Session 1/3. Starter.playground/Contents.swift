//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var x = 12

let age = 99

for value in 1...100 {
    let valueCubed = value * value * value
    value
    valueCubed
    print( valueCubed )
}

var color = UIColor.cyan

for red in [0.3, 0.6, 0.9] {
    color = UIColor(red: CGFloat(red), green: 0.0, blue: 0.0, alpha: 1.0)
}

for red in [0.3, 0.6, 0.9] {
    for blue in [0.3, 0.6, 0.9] {
        for green in [0.3, 0.6, 0.9] {
           color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        }
    }
}


