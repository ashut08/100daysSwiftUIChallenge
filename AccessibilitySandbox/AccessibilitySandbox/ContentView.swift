//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by mac on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedPicture = Int.random(in: 0...3)

    let pictures = [
           "ales-krivec-15949",
           "galina-n-189483",
           "kevin-horstmann-141705",
           "nicolas-tissot-335096"
       ]
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    var body: some View {
        Image(decorative: "character")

    }
}

#Preview {
    ContentView()
}
