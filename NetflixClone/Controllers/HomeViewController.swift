//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by JeongShin on 2023/05/10.
//

import UIKit

let CELL_ID: String = "cell_id";

class HomeViewController: UIViewController {
    
    // mvc??
    private let homeFeedTable: UITableView = ({
        let table = UITableView()
        // UITableViewCell 을 설정
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table;
    })(); // 즉시 실행 클로저 IIFE
    
    //  UIViewController의 뷰가 메모리에 처음으로 로드되고, 인터페이스 빌더 또는 코드를 통해 뷰 계층 구조가 설정된 후에 호출됩니다. 이 메소드는 일반적으로 뷰 컨트롤러에서 사용할 데이터를 초기화하거나, 뷰를 설정하는 코드를 작성하는데 사용됩니다.
    
    
    // 컨트롤러와 관련된 초기화 작업
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        view.addSubview(homeFeedTable)
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        
        
//        let url = URL(string: "https://m.media-amazon.com/images/M/MV5BOTJhNzlmNzctNTU5Yy00N2YwLThhMjQtZDM0YjEzN2Y0ZjNhXkEyXkFqcGdeQXVyMTEwMTQ4MzU5._V1_FMjpg_UX1000_.jpg")
        
        
//        let imageView = UIImageView()
        
//        let data = try? Data(contentsOf: url!)
//        imageView.image = UIImage(data: data!)
        
        
        
//        header.insertSubview(imageView, at: 0)
    
        
        // 이벤트 처리
        homeFeedTable.delegate = self
        
        // 데이터 할당
        homeFeedTable.dataSource = self
        
        homeFeedTable.tableHeaderView = header
    }
    
    // 뷰의 레이아웃이 변경되었을 때(예: 회전이나 크기 조정 등) 호출됩니다. 레이아웃 변경 후, 뷰의 크기와 위치가 변경되면 이 메서드가 호출됩니다. 이 메소드를 사용하면 뷰의 레이아웃이 변경된 후 추가적인 작업을 수행할 수 있습니다. 예를 들어, 뷰의 하위 뷰를 재배치하거나, 뷰의 프레임을 업데이트할 수 있습니다.
    // 뷰의 레이아웃이 변경된 후 추가 작업에 사용됩니다
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews")
        
        homeFeedTable.frame = view.bounds
        // viewDidLoad 뷰 컨트롤러의 뷰 계층이 로드된 직후에 호출됩니다. 이때는 뷰의 크기와 위치가 정해지지 않은 상태이므로, frame 값을 설정해도 제대로 적용되지 않을 수 있습니다
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

/*
 func someViewFn(view: UIView?) {
   if let unwrapped: UIView = view {
     let castedLabel: UILabel? = unwrapped as? UILabel  -> nil or UILabel
     if let unwrappedLabel: UILabel = castedLabel {
        print(unwrappedLabel.text ?? "empty")
     }
   }
 }
 
 
 */


func someViewFn(view: UIView?) -> String {
    guard let unwrappedView: UIView = view else {
        print("view is nil")
        return "empty"
    }
   
    let castedLabel: UILabel? = unwrappedView as? UILabel
    
    guard let label: UILabel = castedLabel else {
        return "empty"
    }
    
    return label.text ?? "empty text"
}

//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}

