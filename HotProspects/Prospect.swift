//
//  Prospect.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-24.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String = "Anonymous"
    var emailAddress: String = ""
    var isContacted: Bool = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}
