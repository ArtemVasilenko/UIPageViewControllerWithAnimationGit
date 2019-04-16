
import UIKit

class MyViewController: UIPageViewController {
    
    var cars = [CarsHelper]()
    
    let bmw = UIImage(named: "bmw")
    let audi = UIImage(named: "audi")
    let porshe = UIImage(named: "porshe")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"
        
        let bmwCar = CarsHelper(name: "BWM", image: bmw!)
        let audiCar = CarsHelper(name: "AUDI", image: audi!)
        let porsheCar = CarsHelper(name: "PORSHE", image: porshe!)
        
        cars = [bmwCar, audiCar, porsheCar]
        
        dataSource = self
        
    }
    
    lazy var arrayCarVCs: [CarViewController] = {
        var carVC = [CarViewController]()
        
        cars.forEach {
            carVC.append(CarViewController(carWith: $0))
        }
        
        return carVC
    }()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        
        view.backgroundColor = .green
        setViewControllers([arrayCarVCs[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MyViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = arrayCarVCs.firstIndex(of: viewController as! CarViewController) else { return nil }
        let previusIndex = vcIndex - 1
        
        guard previusIndex >= 0 else { return nil }
        guard arrayCarVCs.count > previusIndex else { return nil }
        
        return arrayCarVCs[previusIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = arrayCarVCs.firstIndex(of: viewController as! CarViewController) else { return nil }
        let nextIndex = vcIndex + 1
        
        guard nextIndex >= 0 else { return nil }
        guard arrayCarVCs.count > nextIndex else { return nil }
        
        return arrayCarVCs[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrayCarVCs.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
