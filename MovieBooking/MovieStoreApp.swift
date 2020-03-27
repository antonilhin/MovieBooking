//
//  MovieStoreApp.swift
//  MovieBooking
//
//  Created by Antoni on 27/03/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

struct MovieStoreApp: View {
    
    @ObservedObject private var model = MovieViewModel()
    
    var body: some View {
       let movieCollectionView = createCollectionView().edgesIgnoringSafeArea(.all).navigationBarTitle("Movies")
        
        return NavigationView {
            movieCollectionView
        }
    }
    
    fileprivate func createCollectionView() -> MovieCollectionView {
          return MovieCollectionView(allItems: model.allItems, didSelectItem: { indexPath in }, seeAllforSection: { section in })
      }
}

struct MovieStoreApp_Previews: PreviewProvider {
    static var previews: some View {
        MovieStoreApp()
    }
}
