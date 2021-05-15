//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Anis on 15/05/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if let videoBundle = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: videoBundle)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
