//
//  ClientViewController.swift
//  PT Diary
//
//  Created by Ryan Ball on 16/06/2017.
//  Copyright © 2017 Ryan Ball. All rights reserved.
//

import UIKit
import CoreData

class ClientViewController: UIViewController  {
    
    var client: Client? = nil
    
    var weekOneWeight = ""
    var weekOneBMI = ""
    var weekOneNeck = ""
    var weekOneShoulders = ""
    var weekOneChest = ""
    var weekOneBicep = ""
    var weekOneWaist = ""
    var weekOneHips = ""
    var weekOneThigh = ""
    
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var neckLabel: UILabel!
    @IBOutlet weak var shouldersLabel: UILabel!
    @IBOutlet weak var chestLabel: UILabel!
    @IBOutlet weak var bicepLabel: UILabel!
    @IBOutlet weak var waistLabel: UILabel!
    @IBOutlet weak var hipsLabel: UILabel!
    @IBOutlet weak var thighLabel: UILabel!
    
    @IBOutlet weak var weekOneButtonBlack: UIButton!
    @IBOutlet weak var weekTwoButtonBlack: UIButton!
    @IBOutlet weak var weekThreeButtonBlack: UIButton!
    @IBOutlet weak var weekFourButtonBlack: UIButton!
    @IBOutlet weak var weekFiveButtonBlack: UIButton!
    @IBOutlet weak var weekSixButtonBlack: UIButton!
    @IBOutlet weak var weekSevenButtonBlack: UIButton!
    @IBOutlet weak var weekEightButtonBlack: UIButton!
    @IBOutlet weak var weekNineButtonBlack: UIButton!
    @IBOutlet weak var weekTenButtonBlack: UIButton!
    @IBOutlet weak var weekElevenButtonBlack: UIButton!
    @IBOutlet weak var weekTwelveButtonBlack: UIButton!
    
    @IBOutlet weak var statisticsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.title = client!.name
        dobLabel.text = client!.dob
        telephoneLabel.text = client!.telephone
        emailLabel.text = client!.email
        heightLabel.text = String(describing: client!.height)
        weightLabel.text = String(describing: client!.day1Weight)
        bmiLabel.text = client!.day1Bmi
        neckLabel.text = String(client!.day1Neck)
        shouldersLabel.text = String(client!.day1Shoulders)
        chestLabel.text = String(client!.day1Chest)
        bicepLabel.text = String(client!.day1Bicep)
        waistLabel.text = String(client!.day1Waist)
        hipsLabel.text = String(client!.day1Hips)
        thighLabel.text = String(client!.day1Thigh)
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WeekStatsSegue" {
            
            let destinationVC = segue.destination as! WeekStatsViewController
            destinationVC.client = client
            
        }
    }

    @IBAction func weekOneButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        getData()
        
        dobLabel.text = client!.dob
        telephoneLabel.text = client!.telephone
        emailLabel.text = client!.email
        heightLabel.text = String(describing: client!.height)
        //weekOneWeight = weightLabel.text!
        weightLabel.text = String(describing: client!.oneWeekWeight)
        //weekOneBMI = ""
        bmiLabel.text = client!.oneWeekBmi
        neckLabel.text = String(describing: client!.oneWeekNeck)
        shouldersLabel.text = String(describing: client!.oneWeekShoulders)
        chestLabel.text = String(describing: client!.oneWeekChest)
        bicepLabel.text = String(describing: client!.oneWeekBicep)
        waistLabel.text = String(describing: client!.oneWeekWaist)
        hipsLabel.text = String(describing: client!.oneWeekHips)
        thighLabel.text = String(describing: client!.oneWeekThigh)
        
        statisticsLabel.text = "Week 1 Statistics"
        
    }
    
    @IBAction func weekTwoButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 2 Statistics"
        
    }
    
    @IBAction func weekThreeButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 3 Statistics"
        
    }
    
    @IBAction func weekFourButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 4 Statistics"
        
    }
    
    @IBAction func weekFiveButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 5 Statistics"
        
    }
    
    @IBAction func weekSixButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 6 Statistics"
        
    }
    
    @IBAction func weekSevenButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 7 Statistics"
        
    }
    
    @IBAction func weekEightButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 8 Statistics"
        
    }
    
    @IBAction func weekNineButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 9 Statistics"
        
    }
    
    @IBAction func weekTenButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 10 Statistics"
        
    }
    
    @IBAction func weekElevenButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 11 Statistics"
        
    }
    
    @IBAction func weekTwelveButton(_ sender: Any) {
        
        weekOneButtonBlack.setImage(UIImage(named: "Week 1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwoButtonBlack.setImage(UIImage(named: "Week 2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekThreeButtonBlack.setImage(UIImage(named: "Week 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFourButtonBlack.setImage(UIImage(named: "Week 4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekFiveButtonBlack.setImage(UIImage(named: "Week 5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSixButtonBlack.setImage(UIImage(named: "Week 6")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekSevenButtonBlack.setImage(UIImage(named: "Week 7")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekEightButtonBlack.setImage(UIImage(named: "Week 8")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekNineButtonBlack.setImage(UIImage(named: "Week 9")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTenButtonBlack.setImage(UIImage(named: "Week 10")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekElevenButtonBlack.setImage(UIImage(named: "Week 11")?.withRenderingMode(.alwaysOriginal), for: .normal)
        weekTwelveButtonBlack.setImage(UIImage(named: "Week 12 Selected")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        statisticsLabel.text = "Week 12 Statistics"
        
    }
    
    func getData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            clientItems = try context.fetch(Client.fetchRequest())
        } catch {
            print("Fetch Failed")
        }
    }
}
