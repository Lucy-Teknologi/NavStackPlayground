//
//  ContentView.swift
//  NavStackPlayground
//
//  Created by Lucy on 22/09/23.
//

import SwiftUI

struct DeepDisplayNavArg: Hashable {
    
}

struct ContentView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var navigation = NavigationObservable()
    private var currentDestination: NavigationDestination {
        navigation.destinations.first ?? .welcome
    }
    
    @ViewBuilder func NavigationRouter(destination: NavigationDestination) -> some View {
        switch destination {
        case .welcome:
            WelcomeView(onNavigate: { navigation.replacing(with: .input_name) })
                .transition(.slide)
        case .input_name:
            InputNameView(
                title: "Input Name",
                navigate: { navigation.replacing(with: .input_other) }
            )
            .transition(.slide)
        case .display(let name):
            DisplayView(navigate: navigation.navigate, name: name)
                .transition(.opacity)
        case .deep_display(let name, let value):
            DeepDisplayView(name: name, number: value, toTop: { navigation.toTopLevel() })
                .transition(.opacity)
        case .input_other:
            InputNameView(
                title: "Input Other",
                navigate: { navigation.replacing(with: .input_name) }
            )
            .transition(.opacity)
        }
    }
    
    var body: some View {
        NavigationStack(path: $navigation.destinations) {
            EmptyView()
                .progressViewStyle(.circular)
                .navigationDestination(
                    for: DeepDisplayNavArg.self,
                    destination: { arg in  }
                )
                .navigationDestination(
                    for: NavigationDestination.self,
                    destination: {
                        NavigationRouter(destination: $0).navigationBarBackButtonHidden()
                    }
                )
        }
        .animation(.easeIn, value: currentDestination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
