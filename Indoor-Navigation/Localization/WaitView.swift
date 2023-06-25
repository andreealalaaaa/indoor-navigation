//
//  WaitView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 22.06.2023.
//

import SwiftUI

struct WaitView: View {
    var body: some View {
        VStack{
            Text("Please wait and don't move while your location is computed!")
                .font(.title)
                .bold()
                .frame(width: 300)
                .padding(.top, 100)
            
            WaitGif("biggerwait")
                .padding(.bottom, 200)
        }
    }
}

struct WaitView_Previews: PreviewProvider {
    static var previews: some View {
        WaitView()
    }
}
