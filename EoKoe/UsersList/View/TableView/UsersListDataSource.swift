//
//  UsersListDataSource.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

final class UsersListDataSource :  NSObject {
     var view: UsersListDisplayMethods?
}

extension UsersListDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let results = view?.list else {
            return 0
        }
        
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let results = view?.list else { return UITableViewCell() }
        let cell: UsersListCell = tableView.dequeueReusableCell(for: indexPath)
        let model = results[indexPath.row]
        cell.model = model
        return cell
    }
    

}
