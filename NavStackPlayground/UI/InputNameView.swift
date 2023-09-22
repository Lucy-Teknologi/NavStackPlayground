//
//  InputNameView.swift
//  NavStackPlayground
//
//  Created by Lucy on 22/09/23.
//

import SwiftUI

struct InputNameView: View {
    
    var title: String
    var navigate: () -> Void
    @State private var fieldContent: String = ""
    
    var body: some View {
        VStack {
            Text(title)
            TextField(
                "Enter a name",
                text: $fieldContent
            )
            .textFieldStyle(.roundedBorder)
            
            Button("Navigate", action: navigate)
            
            NavigationLink(
                "View",
                value: NavigationDestination.display(name: fieldContent)
            )
            .buttonStyle(.bordered)
        }
    }
}

struct InputNameView_Previews: PreviewProvider {
    static var previews: some View {
        InputNameView(title: "Something") {}
    }
}
