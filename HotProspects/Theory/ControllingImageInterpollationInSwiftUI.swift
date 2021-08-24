//
//  ControllingImageInterpollationInSwiftUI.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-23.
//

import SwiftUI

struct ControllingImageInterpollationInSwiftUI: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ControllingImageInterpollationInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ControllingImageInterpollationInSwiftUI()
    }
}
