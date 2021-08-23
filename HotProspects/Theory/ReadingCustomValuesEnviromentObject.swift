//
//  ReadingCustomValuesEnviromentObject.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-23.
//

import SwiftUI


class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ReadingCustomValuesEnviromentObject: View {
    let user = User()
    var body: some View {
        VStack {
            EditView().environmentObject(user)
            DisplayView().environmentObject(user)
        }
        .environmentObject(user)
    }
}

struct ReadingCustomValuesEnviromentObject_Previews: PreviewProvider {
    static var previews: some View {
        ReadingCustomValuesEnviromentObject()
    }
}
