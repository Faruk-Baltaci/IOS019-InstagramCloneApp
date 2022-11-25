//
//  ViewController.swift
//  InstaCloneProject
//
//  Created by Faruk Eymen Baltaci on 22.11.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser != nil {
            self.performSegue(withIdentifier: "toFeedVC", sender: nil)
        }
        
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.MakeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
            
            
        } else {
            MakeAlert(titleInput: "Error!", messageInput: "Please fill in all fields.")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                
                if error != nil{
                    self.MakeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            
            self.MakeAlert(titleInput: "Error!", messageInput: "Please fill in all fields.")
            
        }
        
        
        
    }
    
    func MakeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}


