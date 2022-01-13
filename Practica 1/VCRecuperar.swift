//
//  VCRecuperar.swift
//  Practica 1
//
//  Created by Luis Antonio  Manzano Gopar on 11/01/22.
//

import UIKit

class VCRecuperar: UIViewController {
    var usuarios: Array<Usuario> = []
    
    let alertController = UIAlertController(title: "¡Aviso!", message: "", preferredStyle: .alert)
    
    @IBOutlet weak var correo: UITextField!
    @IBAction func enviar(_ sender: Any) {
        if correo.hasText {
            if usuarios.first(where: {$0.email == correo.text}) == nil {
                mostrarMensaje(mensaje: "No se encontro una cuenta con este correo.")
            } else {
                mostrarMensaje(mensaje: "Se envio el correo de recuperacion a \(correo.text!).")
            }
        } else {
            mostrarMensaje(mensaje: "Por favor, ingresa un correo.")
        }
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertAction = UIAlertAction(title: "Aceptar", style: .default) { action in
            print("Acepto")
        }
        alertController.addAction(alertAction)

        // Do any additional setup after loading the view.
    }
    
    func mostrarMensaje(mensaje: String) {
        self.alertController.message = mensaje
        
        self.present(alertController, animated: true) { }
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
