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
        setupNavigationBar()
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
        UITabBar.appearance().barTintColor = Assets.Colors.TabBar.backgroundColor

        if let unselectedTextColor = Assets.Colors.TabBar.unselectedTextColor {
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: unselectedTextColor], for: .normal)
        }
        if let selectedTextColor = Assets.Colors.TabBar.selectedTextColor {
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: selectedTextColor], for: .selected)
        }
    }

    internal func setupNavigationBar() {
        UINavigationBar.appearance().barTintColor = Assets.Colors.NavigationBar.backgroundColor
        UINavigationBar.appearance().tintColor = Assets.Colors.NavigationBar.iconColor
        if let titleColor = Assets.Colors.NavigationBar.titleColor {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: titleColor]
        }
    }

}
