//
//  ClientListViewController.swift
//  PT Diary
//
//  Created by Ryan Ball on 16/06/2017.
//  Copyright © 2017 Ryan Ball. All rights reserved.
//

import UIKit
import CoreData

var clientItems : [Client] = []

class ClientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientItems.count
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let items = clientItems[indexPath.row]
        
        cell.textLabel?.text = items.name
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    
    func getData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            clientItems = try context.fetch(Client.fetchRequest())
        } catch {
            print("Fetch Failed")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let item = clientItems[indexPath.row]
            context.delete(item)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                clientItems = try context.fetch(Client.fetchRequest())
            } catch {
                print("Fetch Failed")
            }
        }
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            
            let destinationVC = segue.destination as! ClientViewController
            let indexPath = tableView.indexPathForSelectedRow
            let client = clientItems[(indexPath?.row)!]
            destinationVC.client = client
            
        }
    }
}
