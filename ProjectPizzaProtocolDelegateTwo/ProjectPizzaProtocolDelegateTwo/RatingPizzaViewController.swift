//
//  RatingPizzaViewController.swift
//  ProjectPizzaProtocolDelegateTwo
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit
import SDWebImage

class RatingPizzaViewController: UIViewController {
    
    var ratingPizza: PizzaElement?
    
    @IBOutlet weak var lblNamePizza: UILabel!
    @IBOutlet weak var imagePizza: UIImageView!
    @IBOutlet weak var lblRatingPizza: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNamePizza()
        setupImagePizza()
        setupRatingPizza()
    }
    
    func setupNamePizza() {
        lblNamePizza.text = ratingPizza?.name ?? ""
    }
    
    func setupImagePizza() {
        let urlImage = URL(string: ratingPizza?.imageURL ?? "")
        imagePizza.sd_setImage(with: urlImage)
    }
    
    func setupRatingPizza() {
        lblRatingPizza.text = "De acordo com nossos clientes, a pizza de \(ratingPizza?.name ?? "") está na posição: \(ratingPizza?.rating ?? 0)/5"
    }
    
    @IBAction func btAdvance(_ sender: Any) {
        if let screen = self.storyboard?.instantiateViewController(withIdentifier: "valuePizza") as? ValuePizzaViewController {
            screen.valuePizza = self.ratingPizza
            self.navigationController?.pushViewController(screen, animated: true)
        }
    }
    
    @IBAction func btBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
