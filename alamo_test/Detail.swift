//
//  Detail.swift
//  alamo_test
//
//  Created by eun-ji on 2023/03/05.
//

import Foundation
import UIKit
import AVKit

class Detail: UIViewController {
    
    var movieResult: MovieResult?
    
    @IBOutlet weak var movieView: UIView!
    
    
    @IBOutlet weak var DetailTitleLabel: UILabel! {
        didSet{
            DetailTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }
    }
    
    @IBOutlet weak var DetailDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailTitleLabel.text = movieResult?.trackName
        DetailDescriptionLabel.text = movieResult?.longDescription
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let hasURL = movieResult?.previewUrl{
            makePlayerAndPlay(urlString: hasURL)
        }
    }
    
    func makePlayerAndPlay(urlString: String){
        if let hasUrl = URL(string: urlString){
            let player = AVPlayer(url: hasUrl)
            let playerLayer = AVPlayerLayer(player: player)
            
            movieView.layer.addSublayer(playerLayer)
            playerLayer.frame = movieView.bounds
            
            player.play()
        }
    }
    
}
