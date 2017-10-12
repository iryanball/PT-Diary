//
//  WeekStatsViewController.swift
//  PT Diary
//
//  Created by Ryan Ball on 23/06/2017.
//  Copyright © 2017 Ryan Ball. All rights reserved.
//

import UIKit
import CoreData

class WeekStatsViewController: UIViewController {
    
    var client: Client? = nil
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weekTextField: UITextField!
    
    @IBOutlet weak var neckTextField: UITextField!
    @IBOutlet weak var shouldersTextField: UITextField!
    @IBOutlet weak var chestTextField: UITextField!
    @IBOutlet weak var bicepTextField: UITextField!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var hipsTextField: UITextField!
    @IBOutlet weak var thighTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
        navigationItem.title = client!.name
        dobLabel.text = client!.dob
        telephoneLabel.text = client!.telephone
        emailLabel.text = client!.email
        heightLabel.text = String(describing: client!.height)
    }
    
    // Dismiss keyboard when empty space tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        weightTextField.endEditing(true)
        weekTextField.endEditing(true)
        neckTextField.endEditing(true)
        shouldersTextField.endEditing(true)
        chestTextField.endEditing(true)
        bicepTextField.endEditing(true)
        waistTextField.endEditing(true)
        hipsTextField.endEditing(true)
        thighTextField.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let editWeight = Double(weightTextField.text!)
        let editWeek = weekTextField.text
        let editNeck = Double(neckTextField.text!)
        let editShoulders = Double(shouldersTextField.text!)
        let editChest = Double(chestTextField.text!)
        let editBicep = Double(bicepTextField.text!)
        let editWaist = Double(waistTextField.text!)
        let editHips = Double(hipsTextField.text!)
        let editThigh = Double(thighTextField.text!)        
        
        do {
         
            let clientItem = Client(context: managedObjectContext)
            
            clientItem.setValue(editWeight, forKey: "oneWeekWeight")
            clientItem.setValue(editWeek, forKey: "weekOneSelected")
            clientItem.setValue(editNeck, forKey: "oneWeekNeck")
            clientItem.setValue(editShoulders, forKey: "oneWeekShoulders")
            clientItem.setValue(editChest, forKey: "oneWeekChest")
            clientItem.setValue(editBicep, forKey: "oneWeekBicep")
            clientItem.setValue(editWaist, forKey: "oneWeekWaist")
            clientItem.setValue(editHips, forKey: "oneWeekHips")
            clientItem.setValue(editThigh, forKey: "oneWeekThigh")
            
            try managedObjectContext.save()
            
            print("Data Saved Successfully")
            
            
        } catch {
            fatalError("Failed to fetch clients: \(error)")
        }
        
    }
    
}
