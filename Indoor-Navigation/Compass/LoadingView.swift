//
//  LoadingView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import SwiftUI

struct LoadingView: View {
    @State private var completion: CGFloat = 0.0
    
    var body: some View {
        NavigationView{
            ZStack{
                loadingText
                LoadingBar()
                    .onAppear {
                        animateLoadingBar()
                    }
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
    
    private func animateLoadingBar() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                    withAnimation {
                        completion += 0.1
                        if completion >= 1.0 {
                            timer.invalidate()
                        }
                    }
                }
    }
    
    struct LoadingView_Previews: PreviewProvider {
        static var previews: some View {
            LoadingView()
        }
    }
}

private extension LoadingView{
    var loadingText: some View{
        Section{
            Text("Please don't move while your location is found!")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 50)
                .padding(.bottom, 400)
        }
    }
}
