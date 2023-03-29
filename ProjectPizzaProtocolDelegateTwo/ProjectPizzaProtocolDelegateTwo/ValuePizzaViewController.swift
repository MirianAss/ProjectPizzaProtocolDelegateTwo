//
//  ValuePizzaViewController.swift
//  ProjectPizzaProtocolDelegateTwo
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit

class ValuePizzaViewController: UIViewController {
    
    var valuePizza: PizzaElement?
    
    @IBOutlet weak var lblNamePizza: UILabel!
    @IBOutlet weak var lblPizzaP: UILabel!
    @IBOutlet weak var lblPizzaM: UILabel!
    @IBOutlet weak var lblPizzaG: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNamePizza()
        setupValuePizzaP()
        setupValuePizzaM()
        setupValuePizzaG()
    }
    
    func setupNamePizza() {
        lblNamePizza.text = valuePizza?.name ?? ""
    }
    
    func setupValuePizzaP() {
        lblPizzaP.text = "PEQUENA - R$\(valuePizza?.priceP ?? 0.0)"
    }
    
    func setupValuePizzaM() {
        lblPizzaM.text = "MÉDIA - R$\(valuePizza?.priceM ?? 0.0)"
    }
    
    func setupValuePizzaG() {
        lblPizzaG.text = "GRANDE - R$\(valuePizza?.priceG ?? 0.0)"
    }
    
    @IBAction func btBackHome(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
