//
//  StreamsCollectionViewCell.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 14.07.2022.
//

import youtube_ios_player_helper
import UIKit

final class StreamsCollectionViewCell: UICollectionViewCell, YTPlayerViewDelegate {

    @IBOutlet weak var playerView: YTPlayerView!
    
    var isPlayed: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playerView.delegate = self
        playerView.layer.masksToBounds = true
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        if isPlayed {
            playerView.playVideo()
        }
    }
    
}

extension StreamsCollectionViewCell: Setupable {
    
    func setup(_ model: Any) {
        guard let object = model as? StreamsViewModel else { return }
        self.isPlayed = object.isPlayed
        playerView.load(withVideoId: object.videoId, playerVars: ["playsinline": 1])
    }
    
}

struct StreamsViewModel: CommonEntity {
    var cellIdentifier: String {
        return "StreamsCollectionViewCell"
    }
    
    var size: CGSize = CGSize(width: 320, height: 240)
    
    let videoId: String
    let isPlayed: Bool
}
