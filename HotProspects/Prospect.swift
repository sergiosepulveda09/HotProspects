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
    
    func getContactedStatus() -> Bool {
        return isContacted
    }
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    static let saveKey: String = "SavedData"
    static let dataKey: String = "ProspectData"
    
    init() {
        self.people = []
        loadData()
    }
    
    func save() {
        let filename = FileManager.default.getDocumentsDirectory().appendingPathComponent(Self.dataKey)
        do {
            let encodedData = try JSONEncoder().encode(self.people)
            try encodedData.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            let input = try String(contentsOf: filename)
            print("THISS IS GONNA BE SAVED!! 😐: \(input)")
                
        } catch {
            print("There was an error saving the data, error \(error.localizedDescription)")
        }
        
        
    }
    
    private func loadData() {
        let filename = FileManager.default.getDocumentsDirectory().appendingPathComponent(Self.dataKey)
        do {
            let data = try Data(contentsOf: filename)
            self.people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            print("Unable to load data")
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


extension FileManager {
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}
