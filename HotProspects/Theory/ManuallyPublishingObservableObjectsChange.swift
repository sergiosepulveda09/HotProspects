//
//  ManuallyPublishingObservableObjectsChange.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-23.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
//    @Published var value = 0
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManuallyPublishingObservableObjectsChange: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("The updater values is: \(updater.value)")
    }
}

struct ManuallyPublishingObservableObjectsChange_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublishingObservableObjectsChange()
    }
}
