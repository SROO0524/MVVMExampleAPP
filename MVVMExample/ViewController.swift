//
//  ViewController.swift
//  MVVMExample
//
//  Created by 김믿음 on 2020/11/16.
//

import UIKit




class ViewController: UIViewController {
 
//    MARK: Properties
    private var models = [Person]()


    private let tableview : UITableView = {
        let table = UITableView()
        table.register(PersonFolloingTableViewCell.self, forCellReuseIdentifier: PersonFolloingTableViewCell.identifier)
        return table
    }()
    
 //    MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.frame = view.bounds
        
    }
    
//    MARK: Configure
    private func configureModels() {
        let names = [
            "midum","siroo","juno","hyunjin","suzy"
        ]
        
        for name in names {
            models.append(Person(name: name))
        }
    }


}

//    MARK: Extension
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: PersonFolloingTableViewCell.identifier, for: indexPath) as? PersonFolloingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: PersonFollowingTableViewCellViewModel(with: model)
        )
        cell.delegate = self
        return cell
    }

}

extension ViewController : PersonFolloingTableViewCellDelegate {
    func personfollowingTableViewCell(_ cell: PersonFolloingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel) {
        
        if viewModel.currentlyFollowing {
            
        }
    }
    
    
}

