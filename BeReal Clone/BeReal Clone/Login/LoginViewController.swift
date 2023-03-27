//
//  LoginViewController.swift
//  BeReal Clone
//
//  Created by Lian Biak Hong on 3/23/23.
//

import UIKit
import ParseSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginTapped(_ sender: Any) {
        // Make sure all fields are non-nil and non-empty.
        guard let username = userNameField.text,
              let password = passwordField.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }

        // TODO: Pt 1 - Log in the parse user
        User.login(username: username, password: password){ [weak self] result in
            
            switch result{
            case .success(let user):
                print("✅ Successfully logged in as user: \(user)")
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
            
        }

    }
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Log in", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
