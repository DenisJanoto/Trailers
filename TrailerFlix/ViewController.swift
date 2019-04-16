//
//  ViewController.swift
//  TrailerFlix
//
//  Created by Denis Janoto on 19/03/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //VARIABLES
    var trailers:[Trailer]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrailers()
    }
    
    
    //CREATE ARRAY FROM JSON FILE
    func loadTrailers(){
        guard let url = Bundle.main.url(forResource: "trailers", withExtension: "json") else {return}
        
        do {
            let trailersData = try Data(contentsOf: url)
            self.trailers = try JSONDecoder().decode([Trailer].self, from: trailersData)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    //BUTTON TO CHOICE ANY TRAILER (ALEATORY)
    @IBAction func wathRandonTrailer(_ sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(trailers.count)))
        showTrailer(randomIndex)
    }
    
    //SHOW TRAILER ON SCREEN 2
    func showTrailer(_ index:Int){
        let trailer = trailers[index]
        performSegue(withIdentifier: "segue1", sender: trailer)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TrailerViewController
        
        //sender as! Trailer está vindo do metodo performSegue
        vc.trailer = sender as! Trailer
    }
    
    
    
}






extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let trailer = trailers[indexPath.row]
        cell.textLabel?.text = trailer.title
        cell.detailTextLabel?.text = "\(trailer.year)"
        cell.imageView?.image = UIImage(named: trailer.poster)
        return cell
    }
    
    //TOUCH IN TABLEVIEW CELL
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        //CALL THE METHOD ACCORDING CLICKED CELL
        showTrailer(index)
    }
    
}

