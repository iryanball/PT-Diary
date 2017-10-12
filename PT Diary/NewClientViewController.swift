//
//  NewClientViewController.swift
//  PT Diary
//
//  Created by Ryan Ball on 16/06/2017.
//  Copyright © 2017 Ryan Ball. All rights reserved.
//

import UIKit
import CoreData

class NewClientViewController: UIViewController, UITextFieldDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
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
    }
    
    // Dismiss keyboard when empty space tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.endEditing(true)
        dobTextField.endEditing(true)
        telephoneTextField.endEditing(true)
        emailTextField.endEditing(true)
        heightTextField.endEditing(true)
        weightTextField.endEditing(true)
        neckTextField.endEditing(true)
        shouldersTextField.endEditing(true)
        chestTextField.endEditing(true)
        bicepTextField.endEditing(true)
        waistTextField.endEditing(true)
        hipsTextField.endEditing(true)
        thighTextField.endEditing(true)
    }
    
    // Dismiss keyboard when return tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        if nameTextField.text == "" || dobTextField.text == "" || telephoneTextField.text == "" || emailTextField.text == "" || heightTextField.text == "" || weightTextField.text == "" || neckTextField.text == "" || shouldersTextField.text == "" || chestTextField.text == "" || bicepTextField.text == "" || waistTextField.text == "" || hipsTextField.text == "" || thighTextField.text == "" {
            
            // Create the alert controller
            let alertController = UIAlertController(title: "All Fields Required", message: "You are required to fill in all fields when registering a new client", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            
            // Add the actions
            alertController.addAction(okAction)
            
            // Present the controller
            self.present(alertController, animated: true, completion: nil)
            
        } else {
        
        let clientItem = Client(context: managedObjectContext)
        
        clientItem.name = nameTextField.text
        clientItem.dob = dobTextField.text
        clientItem.telephone = telephoneTextField.text
        clientItem.email = emailTextField.text
        clientItem.height = Double(heightTextField.text!)!
        clientItem.day1Weight = Double(weightTextField.text!)!
        clientItem.day1Neck = Double(neckTextField.text!)!
        clientItem.day1Shoulders = Double(shouldersTextField.text!)!
        clientItem.day1Chest = Double(chestTextField.text!)!
        clientItem.day1Bicep = Double(bicepTextField.text!)!
        clientItem.day1Waist = Double(waistTextField.text!)!
        clientItem.day1Hips = Double(hipsTextField.text!)!
        clientItem.day1Thigh = Double(thighTextField.text!)!
        
        let bmi = Double(weightTextField.text!)! / Double(heightTextField.text!)! / Double(heightTextField.text!)!
        let doubleString = String(format: "%.2f", bmi)
        
        clientItem.day1Bmi = doubleString
        
        do
        {
            try self.managedObjectContext.save()
            
            print("Data saved successfully!")
            
            performSegue(withIdentifier: "TableViewSegue", sender: nil)
        }
        catch
        {
            print("Could not save data \(error.localizedDescription)")
        }
            
        }
        
    }
    
}


