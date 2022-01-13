//
//  ViewController.swift
//  Practica 1
//
//  Created by Luis Antonio  Manzano Gopar on 10/01/22.
//

import UIKit

class ViewControllerLogin: UIViewController {
    var usuarios: Array<Usuario> = []
    var str = "default"
    
    let alertController = UIAlertController(title: "¡Aviso!", message: "", preferredStyle: .alert)
    
    @IBAction func iniciarSesion(_ sender: Any) {
        validarDatos()
    }
    
    @IBOutlet weak var numEmpleado: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertAction = UIAlertAction(title: "Aceptar", style: .default) { action in
            print("Acepto")
        }
        alertController.addAction(alertAction)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(str)
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is VCRegistro) {
            let vcd = segue.destination as? VCRegistro
            vcd?.usuarios = usuarios
            vcd?.callBack = { (usuarios) in
                self.usuarios = usuarios
                dump(self.usuarios)
            }
        }
        
        if (segue.destination is VCRecuperar) {
            let vcd2 = segue.destination as? VCRecuperar
            vcd2?.usuarios = usuarios
        }
    }
    
    func validarDatos() -> Bool {
        var isDatosValidos: Bool = false
        
        let numeroEmpleado: Int = Int(numEmpleado.text!) ?? 0
        
        if let usuarios = usuarios as? [Usuario] {
            for usuario in usuarios {
                if numeroEmpleado == usuario.numeroEmpleado && pass.text == usuario.password {
                    isDatosValidos = true
                }
            }
        }
        
        return isDatosValidos
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var continuar: Bool = true
        
        print("Identificador: \(identifier)")
        
        if identifier == "VCMenu" {
            if !validarDatos() {
                continuar = false;
                mostrarMensaje(mensaje: "Usuario y/o contraseña incorrecto")
            }
        }
       
        
        return continuar
    }
    
    func mostrarMensaje(mensaje: String) {
        self.alertController.message = mensaje
        
        self.present(alertController, animated: true) { }
    }
}

