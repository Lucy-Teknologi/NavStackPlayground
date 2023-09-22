//
//  WelcomeView.swift
//  NavStackPlayground
//
//  Created by Lucy on 22/09/23.
//

import SwiftUI

struct WelcomeView: View {
    
    let onNavigate: () -> Void
    
    var body: some View {
        Button(
            action: onNavigate,
            label: { Text("To Input") }
        )
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(onNavigate: {})
    }
}
