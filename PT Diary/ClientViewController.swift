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
    
    var passData: ClientListViewController!
    var clientItems : [Client] = []
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            clientItems = try context.fetch(Client.fetchRequest())
        } catch {
            print("Fetch Failed")
            
        }
        
        navigationItem.title = clientItems[0].name
    }
    
}
