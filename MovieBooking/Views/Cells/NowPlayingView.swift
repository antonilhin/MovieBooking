//
//  NowPlayingView.swift
//  MovieBooking
//
//  Created by Antoni on 30/10/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

@available(iOS 14.0, *)
struct NowPlayingView: View {
    
    var movie: MovieViewModel
    
    var body: some View {
        return
            KFImage(source: .network(movie.backdropUrl))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                Text(movie.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top)
                    ), alignment: .bottom
            ).cornerRadius(20)
    }
}

@available(iOS 14.0, *)
struct NowPlayingView_Previews: PreviewProvider {
    
    static var previews: some View {
        NowPlayingView(movie: MovieViewModel.default)
    }
}
