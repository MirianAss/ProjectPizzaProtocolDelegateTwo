//
//  ListPizzaViewController.swift
//  ProjectPizzaProtocolDelegateTwo
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit

class ListPizzaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayPizza: Pizza?
    let request = Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        myRequest()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "PizzaTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func myRequest() {
        request.delegate = self
        request.requestPizza { arrayDePizza in
        }
    }
}

extension ListPizzaViewController: RequestDelegate {
    func finishProtocol(arrayDePizza: Pizza?) {
        self.arrayPizza = arrayDePizza
        self.tableView.reloadData()
    }
}

extension ListPizzaViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPizza?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PizzaTableViewCell {
            
            cell.setupPizza(pizza: self.arrayPizza?[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ListPizzaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screen = self.storyboard?.instantiateViewController(withIdentifier: "ratingPizza") as? RatingPizzaViewController {
            screen.ratingPizza = self.arrayPizza?[indexPath.row]
            self.navigationController?.pushViewController(screen, animated: true)
        }
    }
}
