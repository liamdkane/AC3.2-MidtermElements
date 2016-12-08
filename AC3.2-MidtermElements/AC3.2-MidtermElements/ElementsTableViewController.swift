//
//  ElementsTableViewController.swift
//  AC3.2-MidtermElements
//
//  Created by C4Q on 12/8/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ElementsTableViewController: UITableViewController {

    let elementsEndPoint = "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/elements"
    var elements: [Element] = []
    let segueID = "detailSegue"
    let cellID = "elementCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIRequestManager.manager.getData(endPoint: elementsEndPoint) { (data: Data?) in
            guard let d = data else { return }
            self.elements = APIRequestManager.manager.parseData(data: d)!
            DispatchQueue.main.async {
                print(self.elements.count)
                self.tableView.reloadData()
            }
        }
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return elements.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let currentElement = elements[indexPath.row]
        
        cell.textLabel?.text = currentElement.name
        cell.detailTextLabel?.text = "\(currentElement.symbol)(\(currentElement.number)) \(currentElement.weight)"
        APIRequestManager.manager.getData(endPoint: "https://s3.amazonaws.com/ac3.2-elements/\(currentElement.symbol)_200.png") { (data: Data?) in
            if let d = data {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: d)
                    cell.setNeedsLayout()
                }
            }
        }

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            let currentCellID = self.tableView.indexPath(for: sender as! UITableViewCell)!.row
            let dvc = segue.destination as! DetailViewController
            dvc.element = elements[currentCellID]
        }
    }
}
