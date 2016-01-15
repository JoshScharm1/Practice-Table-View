//
//  SuperHeroClass.swift
//  Table View Practice
//
//  Created by JScharm on 1/15/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit

class SuperHeroClass: NSObject
{
    var name = ""
    var ailias = ""
    var power = 0
    var image = UIImage(named: "default")
    
    
    
    init(Name: String, Ailias: String, Power: Int, Image: UIImage)
    {
        super.init()
        name = Name
        ailias = Ailias
        power = Power
        image = Image
    }
    init(Name: String, Ailias: String)
    {
        super.init()
        name = Name
        ailias = Ailias
    }
    
}
