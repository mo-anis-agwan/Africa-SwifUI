//
//  VideoListView.swift
//  Africa
//
//  Created by Anis on 30/04/21.
//

import SwiftUI

struct VideoListView: View {
    //MARK:- Properties
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK:- Body
    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                    VideoListItem(video: item)
                        .padding(.vertical, 8)
                }
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // shuffle videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            })
        } //: Navigation
    }
}

    //MARK:- Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
