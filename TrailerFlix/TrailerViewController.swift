//
//  TrailerViewController.swift
//  TrailerFlix
//
//  Created by Denis Janoto on 19/03/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {
    
    
    @IBOutlet weak var ivTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    
    var trailer:Trailer!
    var player:AVPlayer!
    var playerController:AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        preparePlayer()
        
    }
    
    func prepareView(){
        lbTitle.text = trailer.title
        lbYear.text = "\(trailer.year)"
        
        var rating = "Não Avaliado"
        if trailer.rating != 0{
            for _ in 1...trailer.rating{
                rating+="⭐️"
            }
            lbRating.text = rating
            
        }
        
        
        
        ivTrailer.image = UIImage(named: trailer.poster + "-large")//-large, porque tem dois tipos de imagem na library -normal and -large
        
    }
    
    
    //SHOW TRAILER
    func preparePlayer(){
        let url = URL(fileURLWithPath: trailer.url)
        player = AVPlayer(url: url)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = true
        playerController.player?.play()
        playerController.view.frame = viTrailer.bounds//Informar que a area que aparecerá o video será do mesmo tamanho da view
        viTrailer.addSubview(playerController.view)//Adicionar o video na view
    }
    
    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
