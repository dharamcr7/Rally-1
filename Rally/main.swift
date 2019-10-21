//
//  main.swift
//  Rally
//
//  Created by MacStudent on 2019-10-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
print("\n\n**************************************************************************")
print("*********       *********  ******** ********* ********* ******** *********")
print("********* ***** ********    ******* ********* ********** ****** **********")
print("********* ***** ******* **** ****** ********* ************ *** ***********")
print("*********     ******** ****** ***** ********* ************** *************")
print("********* **** ******          **** ********* ************** *************")
print("********* ***** **** ********** *** ********* ************** *************")
print("********* ****** ** ************ **        **        ******* *************")
print("**************************************************************************")
print("**  By  **\n** Jaswinder -  C0761019 **")
print("** Jaspreet  -  C0761789 **")
print("** Dharam    -  C0766599 **")
print("** Harpreet  -  C0764734 **")
print("** (^_^) **\n\n")

//create object of GrandPrix Class
var grandPrix = GrandPrix()

var category = ""
var vType = 1
var addMore = true
    var isSide = true
while(addMore){
    
    //    vehicleMaxSpeed = 0.0
    //    var vehicleWeight = 0
    //    var vehicleFuel = 0
    //    var vehicleType = 0
    
    let vehicle = Vehicle()
    
    var isValid = true
    while(isValid){
        print("Choose your Vehicle Type \n1 for CAR \n2 for MOTORCYCLE")
        let type = readLine()!
        
        switch type{
        case "1":
            isValid = false
            vType = 1
            var go = true
            while(go){
                print("Choose your Vechicle Category \n1 for Touring car \n2 for Racing car")
                let cate = readLine()!
                if(cate == "1"){
                    go = false
                    category = "Touring Car"
                    
                }else if(cate == "2"){
                    go = false
                    category = "Racing Car"
                }else{
                    print("\n**** Wrong Selection! TRY AGAIN ****\n")
                    go = true
                }
                
            }
            
        case "2":
            isValid = false
            vType = 2
       
            var next = true
            while(next){
                
                print("Choose your Vechicle has Sidecar \n1 for YES \n2 for NO")
                let side = readLine()!
                
                if(side == "1"){
                    next = false
                    isSide = true
                }else if(side == "2"){
                    next = false
                    isSide = false
                }else{
                    next = true
                    print("\n**** Wrong Selection! TRY AGAIN ****\n")
                }
            }
        default:
            print("\n**** Wrong Selection! TRY AGAIN ****\n")
            isValid = true
            break
        }
    }
    
    print("Enter Vehicle Name : ")
    let name = readLine()!
    
    print("Enter Vehicle Maximum Speed : ")
    let speed = Double(readLine()!)
    
    print("Enter Vehicle Weight : ")
    let weight = Int(readLine()!)
    
    
    print("Enter Vehicle Fuel : ")
    let fuel = Int(readLine()!)
    
    
    
    
    
    
    if(vType == 1){
        
        let car = Car(vehicleName: name, vehicleMaxSpeed: speed ?? 0.0, vehicleWeight: weight ?? 0, vehicleFuel: fuel ?? 0, categoryType: category, vehicleType: 1)
        
        grandPrix.add(vehicleItem: car)
        
    }else{
        
        let bike = Bike(vehicleName: name, vehicleMaxSpeed: speed ?? 0.0 , vehicleWeight: weight ?? 0, vehicleFuel: fuel ?? 0, isSidecar: isSide, vehicleType: 2)
        
        grandPrix.add(vehicleItem: bike)
    }
    
    
    print("Do you want to add More Vehicle! Choose \n1 for YES \n2 for NO  ")
    
    let choice = readLine()!
    
    switch choice{
    case "1":
        addMore = true
    case "2":
        addMore = false
    default:
        addMore = false
        break
    }
    
    
    
}

// add function to ask user to select how many vehicle for race less than added count.

var totalVehicle:Int = grandPrix.vehicleCount()

var roundCount = 1
repeat{
    
repeat{
    
    print("Total number of vehicles entered is : \(totalVehicle) \nEnter the number of vehicles to select for race randomly :")
    let ch:Int! = Int(readLine()!)
    
    if(ch > 0 && ch <= totalVehicle){

        // add random vehcile LEFT
        var Rname = ""
        if(roundCount == 1){
            Rname = "First"
        }else if(roundCount == 2){
                 Rname = "Second"
        }else if(roundCount == 3){
                 Rname = "Third"
        }
        
        grandPrix.run(turn: 100, selected: ch , roundName : Rname)
        roundCount += 1
        
        
        break;
        
    }else{
        print("Vehicle number to race must be greater than 0 and less or equal to total number of vehicles present!\nTry Again...!!!")
    }
    
}while(true)

}while(roundCount < 4)

