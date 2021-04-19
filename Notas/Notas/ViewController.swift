//
//  ViewController.swift
//  Notas
//
//  Created by Mac18 on 17/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var notaEditar: String?
    var alumnos = ["Alexaa", "David", "Ivan"]
  //  let calif = [0, 100, 100]
    let defaultsDB = UserDefaults.standard
    @IBOutlet weak var Tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Tabla.delegate = self
        Tabla.dataSource = self
       
        if let arregloalumnos = defaultsDB.array(forKey: "alumnos") as? [String]{
            alumnos = arregloalumnos
            
        }
        else{
        alumnos=[""]
        }
        ///print(defaultsDB.array(forKey: "notas"))
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Notas"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selección: \(alumnos[indexPath.row])")
        notaEditar = alumnos[indexPath.row]
        performSegue(withIdentifier: "enviar", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objCelda = Tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        objCelda.textLabel?.text = alumnos[indexPath.row]
       
        
        
        return objCelda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            let objEditar = segue.destination as! NombreAlumnoViewController
            objEditar.recibirNota = notaEditar
            //objVCNombreAlumno.recibirNombre = nombreAlumnoSelec
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
        
    @IBAction func agregarAlumnoButton(_ sender: UIBarButtonItem) {
        //declarar textfield vacio
        var textField = UITextField()
        
        let alerta = UIAlertController(title: "Agregar nota", message: "Nueva", preferredStyle: .alert)
        alerta.addTextField { (textFieldAlerta) in textFieldAlerta.placeholder = "Nota nueva"
            textField = textFieldAlerta
        }
        
        let accionAceptar = UIAlertAction(title: "Aceptar", style: .default){ (_) in
            self.alumnos.append(textField.text ?? "Sin nombre")
            
            self.Tabla.reloadData()
            self.defaultsDB.set(self.alumnos, forKey: "alumnos")
            
            
        }
        
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alumnos.remove(at: indexPath.row)
            Tabla.reloadData()
           
            self.defaultsDB.set(self.alumnos, forKey: "alumnos")
            Tabla.reloadData()
        }
    }

    
}

 
