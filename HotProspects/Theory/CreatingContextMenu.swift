//
//  CreatingContextMenu.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-23.
//

import SwiftUI

struct CreatingContextMenu: View {
    @State private var backgroundColor: Color = Color.red
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background(backgroundColor)
            Text("Change color")
                .padding()
                .contextMenu(ContextMenu(menuItems: {
                    Button(action: {
                        self.backgroundColor = .red
                    }, label: {
                        Text("Red")
                        if self.backgroundColor == .red {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.red)
                        }
                    })
                    Button(action: {
                        self.backgroundColor = .green
                    }, label: {
                        Text("Green")
                        if self.backgroundColor == .green {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    })
                    Button(action: {
                        self.backgroundColor = .blue
                    }, label: {
                        Text("Blue")
                        if self.backgroundColor == .blue {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    })
                }))
        }
        
    }
}

struct CreatingContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        CreatingContextMenu()
    }
}
