//
//  PIzzaTableViewCell.swift
//  ProjectPizzaProtocolDelegateTwo
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit
import SDWebImage

class PIzzaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNamePizza: UILabel!
    @IBOutlet weak var imagePizzaCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupPizza(pizza: PizzaElement?){
        lblNamePizza.text = pizza?.name ?? ""
        let urlImage = URL(string: pizza?.imageURL ?? "")
        imagePizzaCell.sd_setImage(with: urlImage)
    }
}
