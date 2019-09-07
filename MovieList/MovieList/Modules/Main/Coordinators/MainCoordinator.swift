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
        setupTabBar()
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

    internal func setupTabBar() {
        UITabBar.appearance().barTintColor = Assets.Colors.TabBar.background
        UITabBar.appearance().tintColor = Assets.Colors.TabBar.icon
        UITabBar.appearance().unselectedItemTintColor = Assets.Colors.TabBar.selectedIcon
        // change unselected text color to light gray
    }

}
