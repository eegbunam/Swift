//
//  selfDriving.swift
//  classes and object
//
//  Created by Ebuka Egbunam on 5/30/19.
//  Copyright © 2019 Ebuka Egbunam. All rights reserved.
//

import Foundation

class SelfDriving : Car
{
    var destination:String = "1 infinite loop"
    
    override func drive()
    {
        super.drive()
        print("driving on my own")
    }
    
}
