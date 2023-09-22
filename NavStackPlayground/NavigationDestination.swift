//
//  NavigationDestination.swift
//  NavStackPlayground
//
//  Created by Lucy on 22/09/23.
//

import Foundation
import SwiftUI

enum NavigationDestination : Hashable {
    case welcome
    case input_name
    case display(name: String)
    case deep_display(name: String, value: Int)
    case input_other
    
    func isTopLevel() -> Bool {
        switch self {
        case .display(_):
            return false
        case .deep_display(_, _):
            return false
        default:
            return true
        }
    }
}

class NavigationObservable: ObservableObject {
    @Published var destinations: [NavigationDestination] = [.welcome]
    
    func navigate(to destination: NavigationDestination) {  
        destinations.append(destination)
    }
    
    func toTopLevel() {
        destinations.removeAll { destination in !destination.isTopLevel() }
    }
    
    func replacing(with destination: NavigationDestination) {
        destinations = [destination]
    }
    
    func back() {
        destinations.removeLast()
    }
}
