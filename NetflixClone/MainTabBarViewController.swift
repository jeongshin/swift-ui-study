//
//  ViewController.swift
//  NetflixClone
//
//  Created by JeongShin on 2023/05/10.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let home = UINavigationController(rootViewController: HomeViewController())
        let upcoming = UINavigationController(rootViewController: UpcomingViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let downloads = UINavigationController(rootViewController: DownloadsViewController())
        

        setViewControllers([home, upcoming, search, downloads], animated: true)
        
        home.tabBarItem.image = UIImage(systemName: "house")
        home.title = "house"
        
        upcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        upcoming.title = "upcoming"
        
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass");
        search.title = "search"
        
        downloads.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        downloads.title = "downloads"
        
        tabBar.tintColor = .label
    }
}

