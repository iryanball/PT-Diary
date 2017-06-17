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
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // Dismiss keyboard when empty space tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.endEditing(true)
        ageTextField.endEditing(true)
        telephoneTextField.endEditing(true)
        emailTextField.endEditing(true)
        heightTextField.endEditing(true)
        weightTextField.endEditing(true)
    }
    
    // Dismiss keyboard when return tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let clientItem = Client(context: managedObjectContext)
        
        clientItem.name = nameTextField.text
        clientItem.age = ageTextField.text
        clientItem.telephone = telephoneTextField.text
        clientItem.email = emailTextField.text
        clientItem.height = heightTextField.text
        clientItem.weight = weightTextField.text
        
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


