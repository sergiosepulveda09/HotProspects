//
//  SwiftDependenciesPractice.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-24.
//

import SwiftUI
import SamplePackage
struct SwiftDependenciesPractice: View {
    
    let possibleNumbers = Array(1...60)
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
        
    }
    
    var body: some View {
        Text(results)
    }
}

struct SwiftDependenciesPractice_Previews: PreviewProvider {
    static var previews: some View {
        SwiftDependenciesPractice()
    }
}
