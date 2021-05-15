//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Anis on 15/05/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK:- Properties
    var videoSelected: String
    var videoTitle: String
    
    //MARK:- Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                //Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                , alignment: .topLeading
            ) //: VideoPlaeyrs
        } //: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    } //: Body
}

    //MARK:- Preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
