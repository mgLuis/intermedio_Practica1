//
//  VCRegistro.swift
//  Practica 1
//
//  Created by Luis Antonio  Manzano Gopar on 10/01/22.
//

import UIKit

class VCRegistro: UIViewController {
    
    let alertController = UIAlertController(title: "¡Aviso!", message: "", preferredStyle: .alert)
    let alertConfirmaRegistro = UIAlertController(title: "¡Aviso!", message: "", preferredStyle: .alert)
    var usuarios: Array<Usuario> = []
    var callBack: ((Array<Usuario>) -> Void)?
    
    @IBOutlet weak var numEmpleado: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var confirmaPass: UITextField!
    @IBOutlet weak var fechaNacimiento: UIDatePicker!
    
    @IBAction func registrar(_ sender: Any) {
        
        if esDatoVacio() {
            mostrarMensaje(mensaje: "Todos los campos son obligatorios.")
            return
        } else if !esCorreoValido(){
            mostrarMensaje(mensaje: "El correo ingresado no es valido.")
            return
        } else if pass.text != confirmaPass.text {
            self.mostrarMensaje(mensaje: "El campo contraseña y confirmar contraseña no coinciden")
            return
        }
        
        registrarUsuario()
        self.alertConfirmaRegistro.message = "El usuario \(numEmpleado.text!) se registro correctamente."
        
        self.present(alertConfirmaRegistro, animated: true) { }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertAction = UIAlertAction(title: "Aceptar", style: .default) { action in
            print("Acepto")
        }
        
        let actionConfirma = UIAlertAction(title: "Aceptar", style: .default) { action in
            print("Confirmo")
            self.callBack?(self.usuarios)
            self.dismiss(animated: true, completion: nil)

        }
        
        alertController.addAction(alertAction)
        alertConfirmaRegistro.addAction(actionConfirma)

        // Do any additional setup after loading the view.
    }
    
    func esCorreoValido() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email.text)
    }
    
    func mostrarMensaje(mensaje: String) {
        self.alertController.message = mensaje
        
        self.present(alertController, animated: true) { }
    }
    
    func esDatoVacio() -> Bool {
        var esVacio: Bool = false
        
        if !numEmpleado.hasText {
            esVacio = true
        } else if !nombre.hasText {
            esVacio = true
        } else if !telefono.hasText {
            esVacio = true
        } else if !pass.hasText {
            esVacio = true
        }
        
        return esVacio
    }
    
    func registrarUsuario() -> Void {
        let numeroEmpleado: Int = Int(numEmpleado.text!) ?? 0
        let usuario = Usuario(numeroEmpleado: numeroEmpleado, nombre: nombre.text!, email: email.text!, telefono: telefono.text!, password: pass.text!, fechaNacimiento: fechaNacimiento.date)
        
        usuarios.append(usuario)
    }
    
}
