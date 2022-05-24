//
//  ContentView.swift
//  InstagramClone
//
//  Created by Gabriel Gomes on 23/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    story("Your story", imageName: "myMemoji", viewed: false)
                    story("sundarPichai", imageName: "ceoPerfil", viewed: true)
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    logoInNavigationBar()
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

fileprivate func logoInNavigationBar() -> some View {
    return HStack {
        Image("instagramLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 130, height: 40)
    }
}

fileprivate func story(_ account: String, imageName: String, viewed: Bool) -> some View {
    return VStack {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 65, height: 65)
            .clipShape(Circle())
            .padding(4)
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(LinearGradient(
                        gradient: Gradient(colors: viewed ? [.yellow, .orange, .purple, .purple] :
                                            [.init(red: 0, green: 0, blue: 0, opacity: 0.3)]),
                        startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: viewed ? 2.5 : 1.5)
            )
        
        Text(account)
            .font(.caption)
            .foregroundColor(viewed ? .black : .gray)
    }
}
