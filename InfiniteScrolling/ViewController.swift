//
//  ViewController.swift
//  InfiniteScroll
//
//  Created by Ishan Sarangi on 10/07/16.
//  Copyright © 2016 ishan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,MenuTableViewCellDelegate {
    
    var expandedIndexPath : NSIndexPath!
    lazy var searchBar = UISearchBar(frame: CGRectZero)

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "Search for products or store"
        searchBar.barStyle = UIBarStyle.BlackOpaque
        navigationItem.titleView = searchBar

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch(indexPath.row){
        case 0:
            let newCell : MenuTableViewCell =  tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuTableViewCell
            
            if newCell.menuTableViewCellDelegate == nil {
                newCell.menuTableViewCellDelegate = self
            }
            
            cell = newCell
            
        case 1:
            let newCell : CircularTableViewCell =  tableView.dequeueReusableCellWithIdentifier("CarousalCell", forIndexPath: indexPath) as! CircularTableViewCell
            cell = newCell
            
        case 2...4:
            let newCell : ProductTableViewCell =  tableView.dequeueReusableCellWithIdentifier("NormalCell", forIndexPath: indexPath) as! ProductTableViewCell
            newCell.configureWith("product", thumbnailName: "doughnut", title: "Cake", desc: "Delicious")
            cell = newCell
            
            
        default: break
        }
        
        return cell
    }
    
    //MARK : - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight = 100.0
        
        switch(indexPath.row){
        case 0:
            if let _ = expandedIndexPath {
                rowHeight = 217
            } else {
                rowHeight = 111
            }
        case 1:
            rowHeight = 250.0
        case 2...4:
            rowHeight = 265.0
            
        default: break
        }
        
        return CGFloat(rowHeight)
    }
    
    
    func cellTapped(cell : MenuTableViewCell) {
        
        let indexPath = self.tableView.indexPathForCell(cell)
        
        if expandedIndexPath != nil {
            expandedIndexPath = nil
            cell.moreButton.isClicked = false
            
        } else {
            expandedIndexPath = indexPath
            cell.moreButton.isClicked = true
        }
        
        self.tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
}