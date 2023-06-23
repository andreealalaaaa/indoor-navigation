//
//  HomePageView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import SwiftUI

struct HomePageView: View {
    @State private var selectedLocation = 0
    @State private var changeView = false
    var body: some View {
        NavigationView{
            ZStack{
                NavigationGifView("Navigation")
                    .frame(width: 400, height: 400)
                    .padding(.bottom, 550)
                homeText
                selection
                buttonText
            }
        }.preferredColorScheme(.light)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

private extension HomePageView{
    var homeText: some View{
        Section{
            Text("Where do you want to go now?")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                
        }
        .padding(.bottom, 50)
        //.padding(.bottom, 600)
    }
    
    var selection: some View{
        Section{
            Picker(selection: $selectedLocation, label: Text("Choose laboratory")) {
                Text("B400").tag(0) //("B400")
                Text("B410").tag(1) //("B410")
                Text("B420").tag(2) //("B420")
                Text("B430").tag(3) //("B430")
            }
            .pickerStyle(.wheel)
            .padding(.top, 130)
        }
    }
    
    var buttonText: some View{
        Section{
            Button("Take me there") {
                changeView = true
            }
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(.mint)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.top, 500)
            .overlay(
                NavigationLink(destination: LocationNavigationView(selectedLocation: selectedLocation).navigationBarBackButtonHidden(true), isActive: $changeView) {
            })
        }
    }
}
