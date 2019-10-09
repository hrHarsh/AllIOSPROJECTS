//
//  ViewController.swift
//  TableForm
//
//  Created by Appinventiv on 10/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var arrayOfTextsLabel = ["Name","Email","Mobile Number","School","City","State","Qualification","College","gender","Date of Birth","Employee ID","Current Company","Nationality"]
    var fieldsData = ModelData()
    @IBOutlet weak var contentTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
//MARK:- TableViewDelegates -
extension ViewController : UITableViewDelegate & UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sign Up"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.detailField.addTarget(self, action: #selector(ViewController.textfieldDidEdit(_:)), for: .editingChanged)
        
        switch indexPath.row {
        case 0:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.name
            cell.detailField.placeholder = "Enter name"
            
        case 1:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.email
            cell.detailField.placeholder = "Enter email"
        case 2:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.phone
            cell.detailField.placeholder = "Enter mobile number"
        case 3:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.school
            cell.detailField.placeholder = "Enter School name"
        case 4:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.city
            cell.detailField.placeholder = "Enter City"
        case 5:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.state
            cell.detailField.placeholder = "Enter State"
        case 6:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.qualification
            cell.detailField.placeholder = "Enter your qualification"
        case 7:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.college
            cell.detailField.placeholder = "Enter College Name"
        case 8:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.gender
            cell.detailField.placeholder = "Enter Gender"
        case 9:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.dob
            cell.detailField.placeholder = "Enter DOB"
        case 10:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.empid
            cell.detailField.placeholder = "Enter Employee ID"
        case 11:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.company
            cell.detailField.placeholder = "Enter your Company Name"
        case 12:
            cell.detailName.text = arrayOfTextsLabel[indexPath.row]
            cell.detailField.text = fieldsData.nationality
            cell.detailField.placeholder = "Enter Nationality"
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as! TableViewCell2
            cell.submitButton.addTarget(self, action: #selector(submitButtonTapped(_:)), for: .touchUpInside)
            return cell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        showAlertMessage(indexPath.row)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: "", handler: {
            action,view,completionHandler  in completionHandler(true)})
        action.backgroundColor = .red
        action.image = UIImage(named: "download.jpg")
        //        action.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "Echo.png"))
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

//MARK:- Private Functions -
extension ViewController {
    
    @objc  func submitButtonTapped(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        vc.dataModel = self.fieldsData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showAlertMessage(_ row: Int){
        
        var message = String()
        
        switch row {
        case 0:
            message = "Enter your name"
            showMessage(message)
        case 1:
            message = "Enter your email"
            showMessage(message)
        case 2:
            message = "Enter your Mobile Number"
            showMessage(message)
        case 3:
            message = "Enter your school"
            showMessage(message)
        case 4:
            message = "Enter your city"
            showMessage(message)
        case 5:
            message = "Enter your state"
            showMessage(message)
        case 6:
            message = "Enter your qualification"
            showMessage(message)
        case 7:
            message = "Enter your college"
            showMessage(message)
        case 8:
            message = "Enter your gender"
            showMessage(message)
        case 9:
            message = "Enter your DOB"
            showMessage(message)
        case 10:
            message = "Enter your Employee ID"
            showMessage(message)
        case 11:
            message = "Enter your Company"
            showMessage(message)
        case 12:
            message = "Enter your nationality"
            showMessage(message)
        default:
            print("out of test cases")
        }
    }
    private  func showMessage(_ message : String){
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
extension ViewController:UITextFieldDelegate {
    
    @objc func textfieldDidEdit(_ textField: UITextField) {
        //            print(#function)
        
        let indexPath = contentTableview.indexPath(for: textField.tableViewCell)!
        
        switch indexPath.row {
        case 0:
            fieldsData.name = textField.text ?? ""
        case 1:
            fieldsData.email = textField.text ?? ""
        case 2:
            fieldsData.phone = textField.text ?? ""
        case 3:
            fieldsData.school = textField.text ?? ""
        case 4:
            fieldsData.city = textField.text ?? ""
        case 5:
            fieldsData.state = textField.text ?? ""
        case 6:
            fieldsData.qualification = textField.text ?? ""
        case 7:
            fieldsData.college = textField.text ?? ""
        case 8:
            fieldsData.gender = textField.text ?? ""
        case 9:
            fieldsData.dob = textField.text ?? ""
        case 10:
            fieldsData.empid = textField.text ?? ""
        case 11:
            fieldsData.company = textField.text ?? ""
        case 12:
            fieldsData.nationality = textField.text ?? ""
        default:
            print("out of test cases")
        }
    }
    //        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //
    //            textField.resignFirstResponder()
    //            return true
    //        }
    
}

extension UIView {
    
    var tableViewCell : UITableViewCell {
        
        var cell = self
        
        while !(cell is UITableViewCell) {
            cell = cell.superview!
        }
        
        return cell as! UITableViewCell
    }
    
}


