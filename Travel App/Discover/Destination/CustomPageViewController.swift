//
//  CustomPageViewController.swift
//  Travel App
//
//  Created by Ibragim Akaev on 10/02/2021.
//

import SwiftUI

class CustomPageViewController: UIPageViewController {
    
    let firstVC = UIHostingController(rootView: Text("First View Controller"))
    let secondVC = UIHostingController(rootView: Text("Second"))
    let thirdVC = UIHostingController(rootView: Text("Third"))
    
    lazy var allControllers: [UIViewController] = [
        firstVC, secondVC, thirdVC
    ]
    
    init() {
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemRed
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == 0 { return nil }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        
        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }
}
