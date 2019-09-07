import Foundation
import Common
import MovieCatalog
import Favorites

class MainCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    var tabBarController: UITabBarController

    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    public func start() {
        loadModules()
    }

    internal func loadModules() {
        let modules: [Module] = [
            MovieCatalogModule(tabBar: tabBarController),
            FavoritesModule(tabBar: tabBarController)
        ]

        for module in modules {
            module.coordinator.start()
        }

    }

}
