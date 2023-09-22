//
//  DisplayView.swift
//  NavStackPlayground
//
//  Created by Lucy on 22/09/23.
//

import SwiftUI

struct DisplayView: View {
    
    let navigate: (NavigationDestination) -> Void
    var name: String
    
    var body: some View {
        VStack {
            Text(name)
            Button(
                "#1",
                action: { navigate(.deep_display(name: name, value: 1)) }
            )
            NavigationLink(
                "#2",
                value: NavigationDestination.deep_display(name: name, value: 2)
            )
            NavigationLink(
                "#3",
                value: NavigationDestination.deep_display(name: name, value: 3)
            )
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(navigate: {_ in }, name: "John Doe")
    }
}
