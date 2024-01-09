//
//  ContentView.swift
//  SystemFonts
//
//  Created by André Vants on 24/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var queryString = ""
    
    let fontNames: [String] = UIFont.familyNames.flatMap(UIFont.fontNames(forFamilyName:))
    
    var displayedFonts: [String] {
        queryString.isEmpty ? fontNames : fontNames.filter { $0.localizedCaseInsensitiveContains(queryString) }
    }
    
    var body: some View {
        NavigationView {
            List(displayedFonts, id: \.self) { fontName in
                Text(fontName)
                    .font(.custom(fontName, size: 24))
            }
            .navigationTitle("System Fonts")
        }
        .searchable(text: $queryString, prompt: "Search fonts")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
