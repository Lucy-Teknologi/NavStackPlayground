//
//  DeepDisplayView.swift
//  NavStackPlayground
//
//  Created by Lucy on 22/09/23.
//

import SwiftUI

struct DeepDisplayView: View {
    
    var name: String
    var number: Int
    
    let toTop: () -> Void
    
    var body: some View {
        VStack {
            Text("\(name) \(number)")
            Button("Back to top", action: toTop)
        }
    }
}

struct DeepDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DeepDisplayView(name: "Hoe", number: 1, toTop: {})
    }
}
