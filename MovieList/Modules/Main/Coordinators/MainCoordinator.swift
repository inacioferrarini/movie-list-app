//    The MIT License (MIT)
//
//    Copyright (c) 2019 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import Common
import Flow
import Ness
import MovieCatalog
import Favorites

class MainCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    var tabBarController: UITabBarController
    var appContext = AppContext()

    lazy var modules: [Module] = {
        let modules: [Module] = [
            MovieCatalogModule(tabBar: tabBarController, appContext: appContext),
            FavoriteMoviesModule(tabBar: tabBarController, appContext: appContext)
        ]
        return modules
    }()
    
    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    public func start() {
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "THE_MOVIE_DB_API_KEY") as? String {
            appContext.theMovieDbApiKey = apiKey
        }
        // try to load currently used language from user's preference
        appContext.appLanguage = Language.englishUSA
        appContext.appTheme = DefaultAppTheme()
        setupTabBar()
        setupNavigationBar()
        loadModules()
    }
    
    public func finish() {
        for module in modules {
            module.coordinator.finish()
        }
    }

    internal func loadModules() {
        for module in modules {
            module.coordinator.start()
        }
    }

    internal func setupTabBar() {
        UITabBar.appearance().barTintColor = appContext.appTheme?.tabBar.backgroundColor

        if let unselectedTextColor = appContext.appTheme?.tabBar.unselectedTextColor {
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: unselectedTextColor], for: .normal)
        }
        if let selectedTextColor = appContext.appTheme?.tabBar.selectedTextColor {
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: selectedTextColor], for: .selected)
        }
    }

    internal func setupNavigationBar() {
        UINavigationBar.appearance().barTintColor = appContext.appTheme?.navBar.iconColor
        UINavigationBar.appearance().tintColor = appContext.appTheme?.navBar.iconColor
        if let titleColor = appContext.appTheme?.navBar.titleColor {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: titleColor]
        }
    }

}
