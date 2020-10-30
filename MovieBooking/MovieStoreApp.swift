//
//  MovieStoreApp.swift
//  MovieBooking
//
//  Created by Antoni on 27/03/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct MovieStoreApp: View {
    
    @State private var section: HomeSection?
    @State private var selectedMovie: MovieViewModel?
    @ObservedObject var model = MovieListViewModel()
    
    var body: some View {
        
        return NavigationView {
            
            if model.sectionMovies.isEmpty{
                LoadingView().frame(width: 50, height: 50)
            } else {
                createSections()
                    .sheet(isPresented: .constant(self.section != nil || selectedMovie != nil), onDismiss: {
                        selectedMovie = nil
                        section = nil
                    }) {
                        selectedMovie.map { SingleMovieView(movieId: $0.id) }
                        section.map { MovieListView(section: $0) }
                    }
            }
            
            
            
        }.onAppear {
            self.model.getSectionMovies()
        }
    }
    
    fileprivate func createSections() -> some View {
        
        ScrollView{
            VStack(spacing: 20) {
                SectionView(sectionType: .NowPlaying, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
                SectionView(sectionType: .Popular, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
                SectionView(sectionType: .Upcoming, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
                SectionView(sectionType: .TopRated, allItems: model.sectionMovies, seeSection: $section, selectedMovie: $selectedMovie)
            }.padding(.top, 20)
        }.navigationTitle(Text("Movies"))
        
    }
}

@available(iOS 14.0, *)
struct MovieStoreApp_Previews: PreviewProvider {
    static var previews: some View {
        MovieStoreApp()
    }
}

