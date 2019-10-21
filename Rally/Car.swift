//
//  Car.swift
//  Rally
//
//  Created by MacStudent on 2019-10-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

class Car: Vehicle {
    
    var categoryType = ""
    
    // Getter and Setter
    
    var vCategoryType:String{
        set{ categoryType = newValue}
        get{
            return categoryType
        }
    }
    
    
    init(vehicleName: String, vehicleMaxSpeed: Double, vehicleWeight: Int, vehicleFuel: Int,categoryType: String, vehicleType : Int) {
        super.init(vehicleName: vehicleName, vehicleMaxSpeed: vehicleMaxSpeed, vehicleWeight: vehicleWeight, vehicleFuel: vehicleFuel, vehicleType: vehicleType)
        self.categoryType = categoryType
    }
    
    override func toString() -> String {
        return "Car Type"
    }
}
