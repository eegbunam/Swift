//
//  car.swift
//  classes and object
//
//  Created by Ebuka Egbunam on 5/30/19.
//  Copyright © 2019 Ebuka Egbunam. All rights reserved.
//

import Foundation
enum carType{
    case Sedan
    case Coupe
    case hatchBack
}
class Car{
    var color:String = "black"
    var numberOfSeats:Int = 5
    var typeOfCar:carType = .Coupe
    
    
    init(customColor:String = "black") {
        color = customColor
    }
    
    func drive()
    {
        print("car is moving")
    }
    
}


