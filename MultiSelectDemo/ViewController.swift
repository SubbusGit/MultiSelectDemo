//
//  ViewController.swift
//  MultiSelectDemo
//
//  Created by Subramanian Chockalingam on 22/10/18.
//  Copyright © 2018 Subramanian Chockalingam. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    struct listData {
        var value:String
        var selected:Bool
    }
     var yearArray = [listData(value: "2017", selected: true),listData(value: "2016", selected: false),listData(value: "2015", selected: false)]
     var titleArray = [listData(value: "Apple", selected: true),listData(value: "Mango", selected: true),listData(value: "Orange", selected: true),listData(value: "Guva", selected: true)]

    @IBOutlet weak var demoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        demoCollectionView.isMultipleTouchEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return yearArray.count } else { return titleArray.count }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:DemoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCollectionViewCell", for: indexPath) as! DemoCollectionViewCell
         if indexPath.section == 0 {
        
            cell.titleLabel.text = yearArray[indexPath.row].value
            let isSelected = yearArray[indexPath.row].selected
            if isSelected{
               cell.selectImage.image = UIImage(named: "checkSelect.png")
            }else{
                cell.selectImage.image = UIImage(named: "checkUnselect.png")
            }
         }
         else {
          
            cell.titleLabel.text = titleArray[indexPath.row].value
            let isSelected = titleArray[indexPath.row].selected
            if isSelected{
                cell.selectImage.image = UIImage(named: "checkSelect.png")
            }else{
                cell.selectImage.image = UIImage(named: "checkUnselect.png")
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
           let isSelected = yearArray[indexPath.row].selected
            if isSelected{
                yearArray[indexPath.row].selected = false
            }else{
                yearArray[indexPath.row].selected = true
            }
        }else{
            let isSelected = titleArray[indexPath.row].selected
            if isSelected{
                titleArray[indexPath.row].selected = false
            }else{
                titleArray[indexPath.row].selected = true
            }
        }
        self.demoCollectionView.reloadData()
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        if  isValidSelection(){
         print("Valid")
        }else{
            print("In Valid")
        }
        
    }
    
    func isValidSelection() -> Bool {
        var isOneYearSelected = false
        var isOneTitleSeected = false
        if yearArray.contains(where: {$0.selected}) {
           isOneYearSelected = true
        }
        if titleArray.contains(where: {$0.selected}) {
            isOneTitleSeected = true
        }
        if isOneYearSelected && isOneTitleSeected {
           
            return true
        }
       
        return false
    }
    
}

