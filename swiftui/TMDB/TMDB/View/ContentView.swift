//
//  ContentView.swift
//  TMDB
//
//  Created by Pranav Suri on 21/07/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Now Playing")) {
                    NowPlayingView()
                }
                Section(header: Text("Popular")) {
                    PopularView()
                }
                
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
