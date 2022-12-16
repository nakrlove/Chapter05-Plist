//
//  PropertiesTableViewController.swift
//  Chapter05-Plist
//
//  Created by nakrlove on 2022/12/16.
//

import UIKit

class ListTableViewController: UITableViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var married: UISwitch!
    
    
    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        alert.addTextField(){
            $0.text = self.name.text
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) {(_) in
            
            let value = alert.textFields?[0].text
            self.setUserDefault(key: "name",value: value)
            self.name.text = value
            
        })
        
        self.present(alert, animated: false, completion: nil)
    }
    
    func setUserDefault(key: String, value: Any){
        let plist = UserDefaults.standard
        plist.set(value,forKey: key)
        plist.synchronize()
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        
//        let plist = UserDefaults.standard
//        plist.set(value,forKey: "gender")
//        plist.synchronize()
        
        setUserDefault(key: "gender",value: value)
        
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn
        
        
        setUserDefault(key: "married",value: value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let plist = UserDefaults.standard
        
        
        self.name.text = plist.string(forKey: "name")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        self.married.isOn = plist.bool(forKey: "married")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if indexPath.row == 0 {
//            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
//            alert.addTextField(){
//                $0.text = self.name.text
//            }
//            
//            alert.addAction(UIAlertAction(title: "OK", style: .default) {(_) in
//                
//                let value = alert.textFields?[0].text
//                self.setUserDefault(key: "name",value: value)
//                self.name.text = value
//                
//            })
//            
//            self.present(alert, animated: false, completion: nil)
//        }
    }
 

}
