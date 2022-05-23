//
//  ContentView.swift
//  InstagramClone
//
//  Created by Gabriel Gomes on 23/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Image("instagramLogo")
                                Text("Sua tia")
                                
                            }
                        }
                    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
        
    }
}
