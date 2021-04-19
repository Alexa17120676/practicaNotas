//
//  NombreAlumnoViewController.swift
//  Notas
//
//  Created by Mac18 on 18/04/21.
//

import UIKit

class NombreAlumnoViewController: UIViewController {
    let defaultsDB = UserDefaults.standard
    var recibirNota: String?
    
    
    @IBOutlet weak var editarnota: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       // nombreLabel.text = recibirNombre
        // Do any additional setup after loading the view.
        
        editarnota.text = recibirNota
       
    }
    

   
    @IBAction func botoneditar(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
