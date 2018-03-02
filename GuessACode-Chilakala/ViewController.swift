//
//  ViewController.swift
//  GuessACode-Chilakala
//
//  Created by student on 2/28/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.code.Symbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = AppDelegate.code.Symbols[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select Next Symbol."
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        HintLBL.text = ""
        AppDelegate.code.addSymbol(str: AppDelegate.code.Symbols[indexPath.row])
        GuessLBL.text = "The Guess : \(AppDelegate.code.currentGuess())"
        StatusLBL.text = AppDelegate.code.statusofGuess()
        print(AppDelegate.code.statusofGuess())
        if AppDelegate.code.Guess.count == AppDelegate.code.Count {
            AppDelegate.code.Guess=[]
            UndoBTN.isEnabled=false
            ResetBTN.isEnabled=true
        } else if AppDelegate.code.Guess.count != 0{
            UndoBTN.isEnabled = true
            ResetBTN.isEnabled = true
        }
    }
    
    
    @IBOutlet weak var GuessLBL: UILabel!
    
    
    @IBOutlet weak var StatusLBL: UILabel!
    
    
    
    @IBOutlet weak var ResetBTN: UIButton!
    @IBOutlet weak var UndoBTN: UIButton!
    
    
    @IBOutlet weak var HintLBL: UILabel!
    
    
    @IBAction func ResetBTN(_ sender: Any) {
        
        AppDelegate.code.reset()
        ResetBTN.isEnabled = false
        UndoBTN.isEnabled = false
        GuessLBL.text = ""
        StatusLBL.text = ""
        AppDelegate.code.Attempts = 1
        
       
        
    }
    @IBAction func UndoBTN(_ sender: Any) {
        if AppDelegate.code.Guess.count != AppDelegate.code.Count || AppDelegate.code.Guess.count != 0 {
        AppDelegate.code.undoSymbol()
        GuessLBL.text = "The Guess : \(AppDelegate.code.currentGuess())"
        StatusLBL.text = AppDelegate.code.statusofGuess()
            
        }
        
    }
    
    
    @IBAction func HintBTN(_ sender: Any) {
        print(AppDelegate.code.Code)
        if AppDelegate.code.Guess.count != AppDelegate.code.Count {
            HintLBL.text = "Next Symbol is \(AppDelegate.code.Code[AppDelegate.code.Guess.count])"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

