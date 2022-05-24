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
                    myStory("Your story", imageName: "gabrielPhotoPerfil", hasPost: false)
                    story("victorMendes", imageName: "victorPhotoPerfil", viewed: false)
                    story("sundarPichai", imageName: "ceoGoogle", viewed: true)
                    story("timCook", imageName: "ceoTimCook", viewed: true)
                    story("victorGR", imageName: "myMemoji", viewed: true)
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
                Circle()
                    .stroke(LinearGradient(
                        gradient: Gradient(colors: viewed ? [.yellow, .orange, .purple, .purple] :
                                            [.init(red: 0, green: 0, blue: 0, opacity: 0.2)]),
                        startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: viewed ? 2.5 : 1.5)
            )
        
        Text(account)
            .font(.caption)
            .foregroundColor(viewed ? .black : .gray)
    }
    .padding(4)
}

fileprivate func myStory(_ account: String, imageName: String, hasPost: Bool) -> some View {
    return VStack {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 65, height: 65)
            .clipShape(Circle())
            .padding(4)
            .overlay(
                Circle()
                    .stroke(LinearGradient(
                        gradient: Gradient(colors: hasPost ? [.yellow, .orange, .purple, .purple] :
                                            [.init(red: 0, green: 0, blue: 0, opacity: hasPost ? 0.3 : 0)]),
                        startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: hasPost ? 2.5 : 1.5)
            )
            .overlay(alignment: .bottomTrailing) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .overlay(
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                            .overlay(
                                Circle()
                                    .stroke(.white, lineWidth: 3)
                            )
                    )
            }
        
        Text(account)
            .font(.caption)
            .foregroundColor(.black)
    }
    .padding(4)
}
