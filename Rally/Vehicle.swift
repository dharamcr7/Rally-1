//
//  Vehicle.swift
//  Rally
//
//  Created by MacStudent on 2019-10-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation





class Vehicle {
    
  
    
    
    
    // All variables describing the properities of Vehicle
    
    var isRight = false
    var vehiclePerformance = 0.0
    var vehicleName = ""
    var vehicleMaxSpeed = 0.0
    var vehicleWeight = 0
    var vehicleFuel = 0
    var vehicleType = 0
    
    
    
    // Getter and Setter
    var v_isRight:Bool{
        set{ isRight = newValue}
        get{
            return isRight
        }
    }
    
    var vPerformance:Double{
        set{ vehiclePerformance = newValue}
        get{
            return vehiclePerformance
        }
    }
    
    
    var vName:String{
        set{ vehicleName = newValue}
        get{
            return vehicleName
        }
    }
    
    var vMaxSpeed1:Double{
        set{ vehicleMaxSpeed = newValue}
        get{
            return vehicleMaxSpeed
        }
    }
    
    var vWeight:Int{
        set{ vehicleWeight = newValue}
        get{
            return vehicleWeight
        }
    }
    
    var vFuel:Int{
        set{ vehicleFuel = newValue}
        get{
            return vehicleFuel
        }
    }
    var vType:Int{
        set{ vehicleType = newValue}
        get{
            return vehicleType
        }
    }
    
    
    // Default Constructor
    init() {
        self.vehicleName = "Anonyms"
        self.vehicleMaxSpeed = 130
        self.vehicleWeight = 1000
        self.vehicleFuel = 0
    }
    
    // Constructor
    init(vehicleName: String,vehicleMaxSpeed:Double,vehicleWeight:Int,vehicleFuel: Int, vehicleType: Int) {
        self.vehicleName = vehicleName
        self.vehicleMaxSpeed = vehicleMaxSpeed
        self.vehicleWeight = vehicleWeight
        self.vehicleFuel = vehicleFuel
        self.vehicleType = vehicleType
    }
    
    
    // A func for getting better returning
    
    func better() -> Bool {
        return true
    }
    
    
    func toString() -> String {
        return   "Vehicle Name : \(vName) -> Max Speed : \(vMaxSpeed1)kmph -> Weight : \(vWeight)kg"
    }
    
}
