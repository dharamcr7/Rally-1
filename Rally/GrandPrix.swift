//
//  GrandPrix.swift
//  Rally
//
//  Created by MacStudent on 2019-10-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

class GrandPrix: Rally, VehicleProtocol {
    
    func performance(speed: Double, weight: Int) -> Double {
        return speed / Double(weight)
    }
    
    
    
    var vehicleList = [Vehicle]()
    var vehicleListSelected = [Vehicle]()
    
    
    override func vehicleCount() -> Int {
        return vehicleList.count
    }
    
    override func check(vehicleItem: Vehicle) -> Bool {
        
        
        if(isTwoWheeled(vehicleItem: vehicleItem) == false){
            
            //            if let car = vehicleItem as? Car{
            //
            //                if(car.categoryType == "Racing Car"){
            //                    return true
            //                }
            //
            //                return false
            //
            //            }else{
            //
            return true
            //
            //            }
        }
        
        
        return false
        
    }
    
    
    
    
    func add(vehicleItem : Vehicle){
        
        vehicleItem.isRight = check(vehicleItem : vehicleItem)
        vehicleItem.vPerformance = performance(speed: vehicleItem.vehicleMaxSpeed, weight: vehicleItem.vehicleWeight)
        
        
        vehicleList.append(vehicleItem)
    }
    
    
    
    func isTwoWheeled(vehicleItem : Vehicle) -> Bool{
        
        if vehicleItem is Car{
            
            return false
            
        }else if let bike = vehicleItem as? Bike{
            
            if(bike.isSidecar){
                return false
            }
            
            
        }
        return true
        
    }
    
    
    //Start Race
    func run(turn : Int, selected : Int , roundName : String){
        
        
        // random ala func 10,4
        var indexAlreadySelected = [Int]()
        
        for _ in 0..<selected{
            
            repeat{
                let number = Int.random(in: 0 ..< vehicleList.count)
                
                if !indexAlreadySelected.contains(number){
                    indexAlreadySelected.append(number)
                    vehicleListSelected.append(vehicleList[number])
                    break
                }
                
            }while(true)
            
        }
        print("\n*********************************************************************************************\n")
        
        print("\(roundName) round:\n")
        
        print("Selected vehicles are :\n")
        for (_,value) in vehicleListSelected.enumerated(){
            print("Vehicle Name : \(value.vName) -> Max Speed : \(value.vMaxSpeed1)kmph -> Weight : \(value.vWeight)kg")
        }
        
        
        var isValidRace : Bool = true
        
        //check for race
        for (_,value) in vehicleListSelected.enumerated(){
            
            if(!value.isRight){
                isValidRace = false
                break
            }
        }
        
        
        if(!isValidRace){
            print("Not Grand Prix\n")
            vehicleListSelected.removeAll()
            return
        }
        
        
        
        //Remove those vehicles have lesser fuel than turns
        var flag = false
        print("\nVehicle won't be able to complete the race due to insufficient fuel are :")
        
                for (index,value) in vehicleListSelected.enumerated().reversed(){
        
                    if(value.vFuel < turn){
                        flag = true
                        print("Vehicle Name : \(value.vName)")
                        vehicleListSelected.remove(at: index)
                    }
                }
        
        if flag == false
        {
            print("No Vehicle with unsufficient fuel!")
        }
        
        
        if(vehicleListSelected.count == 0){
            print("\nAll the Vehicles failed to finish the rally\n")
            return
        }
        //Find the best performed vechicle from list by peformance
        // sort collection by performance (double value)
        
        vehicleListSelected.sort(by: {$0.vPerformance > $1.vPerformance})
        
        
        print("\nRace completed by following vehicles :")
        for i in 0..<vehicleListSelected.count{
            
            let type:Int = vehicleListSelected[i].vType
            var typestr:String
            if(type == 1){
                typestr = "Car"
                let c = vehicleListSelected[i] as? Car
                typestr = c!.vCategoryType
            }else{
                typestr = "Moto"
                let b = vehicleListSelected[i] as? Bike
                if(b!.isSidecar){
                    typestr = "Moto, with sidecar"
                }
            }
            
            print("Vehicle Name : \(vehicleListSelected[i].vName) -> Max Speed : \(vehicleListSelected[i].vMaxSpeed1) -> Weight : \(vehicleListSelected[i].vWeight)kg -> Vehicle Category = \(typestr) -> Vehicle Performance : \(vehicleListSelected[i].vPerformance)")
        }
        
        if let car = vehicleListSelected[0] as? Car{
            print("\nWinner of Grand Prix is : \(vehicleListSelected[0].vName) -> Max Speed : \(vehicleListSelected[0].vMaxSpeed1) -> Weight : \(vehicleListSelected[0].vWeight)kg -> Vehicle Category = \(car.vCategoryType) -> Vehicle Performance : \(vehicleListSelected[0].vPerformance)\n")}
        if let bike = vehicleListSelected[0] as? Bike{
            var bType = "Moto"
            if(bike.isSidecar){
                bType = "Moto, with sidecar"
            }
            print("\nWinner of Grand Prix is : \(vehicleListSelected[0].vName) -> Max Speed : \(vehicleListSelected[0].vMaxSpeed1) -> Weight : \(vehicleListSelected[0].vWeight)kg -> Vehicle Category = \(bType) -> Vehicle Performance : \(vehicleListSelected[0].vPerformance)\n")
            
        }
        
        vehicleListSelected.removeAll()
        
    }
    
    
    
    
}
