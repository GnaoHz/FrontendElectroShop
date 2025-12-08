import SwiftUI

struct MainFlowVỉew: View {
    @ObservedObject var mainCoordinator: MainCoordinator
    var body: some View {
        switch mainCoordinator.currrentScreen {
        case .home:
            
        case .category:
            <#code#>
        case .cart:
            <#code#>
        case .favorite:
            <#code#>
        case .person:
            <#code#>
        }
    }
}
