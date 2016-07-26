//
//  CircularTableViewCell.swift
//  InfiniteScroll
//
//  Created by Ishan Sarangi on 10/07/16.
//  Copyright © 2016 ishan. All rights reserved.
//

import UIKit

class CircularTableViewCell: UITableViewCell, UICollectionViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var circularCollectionView: UICollectionView!
    var adsArray = ["1","2","3","4","5"]
    var timer = NSTimer()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addTimer()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func scheduledTimerWithTimeInterval(){
//        // Scheduling timer to Call the function **Countdown** with the interval of 1 seconds
//        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(CircularTableViewCell.updateCounting), userInfo: nil, repeats: true)
//    }
//    
//    
//    func updateCounting(){
//        self.circularCollectionView.layoutIfNeeded()
//        var visibleItems  = self.circularCollectionView.indexPathsForVisibleItems()
//        let currentItem : NSIndexPath = visibleItems[0]
//        if currentItem.row < adsArray.count-1 {
//            let nextItem : NSIndexPath = NSIndexPath(forItem: currentItem.row+1, inSection: currentItem.section)
//            
//            self.circularCollectionView.scrollToItemAtIndexPath(nextItem, atScrollPosition: UICollectionViewScrollPosition.None, animated: true)
//
//        }
//        else if currentItem.row < adsArray.count {
//            let nextItem : NSIndexPath = NSIndexPath(forItem: currentItem.row-adsArray.count+1, inSection: currentItem.section)
//            
//            self.circularCollectionView.scrollToItemAtIndexPath(nextItem, atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
//
//        }
//    }


    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adsArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("circularScrollCell", forIndexPath: indexPath) as! CircularCollectionViewCell
        cell.configureWith(adsArray[indexPath.row] )
        
        return cell
        
    }
    
    
    //MARK : - Code for infinite loop if manually dragged
//    func photoForIndexPath(indexPath: NSIndexPath) -> String {
//        return adsArray[indexPath.row]
//    }
//    
//    
//    func reverseAdsArray(photoArray:[String], startIndex:Int, endIndex:Int){
//        if startIndex >= endIndex{
//            return
//        }
//        swap(&adsArray[startIndex], &adsArray[endIndex])
//        
//        reverseAdsArray(adsArray, startIndex: startIndex + 1, endIndex: endIndex - 1)
//    }
//    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//
//        let fullyScrolledContentOffset:CGFloat = circularCollectionView.frame.size.width * CGFloat(adsArray.count - 1)
//        if (scrollView.contentOffset.x >= fullyScrolledContentOffset) {
//            
//            if adsArray.count>2{
//                reverseAdsArray(adsArray, startIndex: 0, endIndex: adsArray.count - 1)
//                reverseAdsArray(adsArray, startIndex: 0, endIndex: 1)
//                reverseAdsArray(adsArray, startIndex: 2, endIndex: adsArray.count - 1)
//                let indexPath : NSIndexPath = NSIndexPath(forRow: 1, inSection: 0)
//                circularCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
//            }
//        }
//        else if (scrollView.contentOffset.x == 0){
//            
//            if adsArray.count>2{
//                reverseAdsArray(adsArray, startIndex: 0, endIndex: adsArray.count - 1)
//                reverseAdsArray(adsArray, startIndex: 0, endIndex: adsArray.count - 3)
//                reverseAdsArray(adsArray, startIndex: adsArray.count - 2, endIndex: adsArray.count - 1)
//                let indexPath : NSIndexPath = NSIndexPath(forRow: adsArray.count - 2, inSection: 0)
//                self.circularCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
//            }
//        }
//    }
    
    
    //MARK : - Code for infinite loop if run through timer
    func addTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(CircularTableViewCell.nextPage), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func resetIndexPath() -> NSIndexPath{
        let currentIndexPath : NSIndexPath = circularCollectionView.indexPathsForVisibleItems().last!

        let currentIndexPathReset : NSIndexPath = NSIndexPath(forItem: currentIndexPath.item, inSection: 2)
        self.circularCollectionView.scrollToItemAtIndexPath(currentIndexPathReset, atScrollPosition: UICollectionViewScrollPosition.Left, animated: false)
        return currentIndexPathReset;
        
    }
    func nextPage() {
        
        let currentIndexPathReset : NSIndexPath = self.resetIndexPath()
        var nextItem = currentIndexPathReset.item + 1;
        var nextSection = currentIndexPathReset.section;
        if (nextItem == self.adsArray.count) {
            nextItem = 0;
            nextSection += 1;
        }
        let nextIndexPath: NSIndexPath  = NSIndexPath(forItem: nextItem, inSection: nextSection)
        
        self.circularCollectionView.scrollToItemAtIndexPath(nextIndexPath, atScrollPosition: UICollectionViewScrollPosition.Left, animated: true)
    }
    
    func removeTimer() {
        timer.invalidate()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }

}
