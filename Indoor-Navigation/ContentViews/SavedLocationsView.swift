//
//  SavedLocationsView.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 13.05.2023.
//

//import SwiftUI
//
//struct SavedLocationsView: View {
//    var body: some View {
//        savedList
//        hello
//    }
//}
//
//struct SavedLocationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedLocationsView()
//    }
//}
//
//private extension SavedLocationsView{
//    var savedList: some View{
//        Section{
//            List {
//                Text("B415, AC")
//                Text("A117, AC")
//
//            }
//        }
//    }
//}

import SwiftUI

struct SavedLocationsView: View {
    var body: some View {
        NavigationView {
            savedList
                .navigationTitle("Saved Locations")
        }
    }
}

struct SavedLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedLocationsView()
    }
}

private extension SavedLocationsView {
    var savedList: some View {
        List {
            NavigationLink(destination: LocationDetailView(location: "B415, AC")) {
                Text("B415, AC")
            }.navigationBarBackButtonHidden(true)
            NavigationLink(destination: LocationDetailView(location: "A117, AC")) {
                Text("A117, AC")
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct LocationDetailView: View {
    var location: String
    
    var body: some View {
        Text("Location detail view for \(location)")
            .navigationTitle(location)
    }
}
