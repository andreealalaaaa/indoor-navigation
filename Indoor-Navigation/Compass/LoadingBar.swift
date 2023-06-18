//
//  LoadingBar.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import Foundation
import SwiftUI

struct LoadingBar: View{
    
    var body: some View{
        Section{
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 300, height: 30)
                    .foregroundColor(Color.black.opacity(0.1))
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 300, height: 30)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.purple, .blue, .mint]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    )
                    .foregroundColor(.clear)
            }
        }
    }
}
