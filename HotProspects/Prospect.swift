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
    fileprivate(set) var isContacted: Bool = false
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    static let saveKey: String = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        
        self.people = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
