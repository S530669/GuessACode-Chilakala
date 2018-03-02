//
//  Model.swift
//  GuessACode-Chilakala
//
//  Created by student on 2/28/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

class CodeWord {
    
    
    var Symbols:[String] = []
    var Count:Int = 0
    var Code:[String] = []
    var Guess:[String] = []
    var OnSymbol:Int = 0
    var Attempts:Int = 1
    var Status:String = ""
    
    init(n : Int){
        
        if n >= 4 {
            Count  = n
            Symbols = ["Σ","Φ","Ψ","Ω","Ξ","Θ","ζ"]
            for _ in 1 ... Count{
                Code.append(Symbols[Int(arc4random_uniform(UInt32(Symbols.count)))])
            }
            
        } 
    }
    
    func addSymbol(str : String){
        
        if Guess.count <= Code.count {
            Guess.append(str)
            OnSymbol += 1
            Status = "Attempt \(Attempts): \(Guess.count) guessed"
            if Guess.count == Count {
                Attempts += 1
                OnSymbol = 0
                Status = "Guess Complete: \(noOfCorrectPositions()) positions matched"
            }
        }
    }
    
    func undoSymbol(){
        if Guess.count != 0 {
            Guess.removeLast()
            OnSymbol -= 1
            Status = "Attempt \(Attempts): \(Guess.count) guessed"
        }
    }
    
    func noOfCorrectPositions() -> Int {
        var i:Int = 0
        for _ in 0..<Guess.count{
            if Guess[i] == Code[i]{
                i += 1
            }
        }
        return i
    }
    
    func statusofGuess() -> String {
        return Status
    }
    
    
    func currentGuess() -> String {
        
        var guessString = ""
        for i in 0 ..< Guess.count
        {
            guessString += " \(Guess[i])"
        }
        for _ in Guess.count ..< Count
        {
           guessString += " - "
        }
        
        return guessString
        
    }
    
    func matches() -> Bool {
        var x = 0
        for i in 0..<Count{
            if Guess[i] == Code[i]{
                x = 1
            }else{
                x = 0
                break
            }
        }
        return x == 1
    }
    
    func reset(){
        OnSymbol = 0
        Code = []
        Guess = []
        
        for _ in 1...Count {
            Code.append(Symbols[Int(arc4random_uniform(UInt32(Symbols.count)))])
            
        }
        print(Code)
    }
    
    
}
