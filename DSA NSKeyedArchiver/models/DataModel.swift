//
//  DataModel.swift
//  DSA NSKeyedArchiver
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
class DataModel {
    
    static let kPathName = "DSAListkeyedArchiver.plist"
    private init() {}
    static let shared = DataModel()
    private var lists = [DSA]() {
        didSet {
            saveDSAList()
        }
    }
    //returns documents directory path for the app
    public func documentsDirectory() -> URL {
        let paths = FileManager.default .urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //returns supplied path name in documents directory
    private func dataFilePath(pathName: String) -> URL {
        return DataModel.shared.documentsDirectory().appendingPathComponent(pathName)
    }
    //save
    func saveDSAList() {
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathName).path
        NSKeyedArchiver.archiveRootObject(lists, toFile: path)
        //test
        print(documentsDirectory())
    }

    //load
    func load() {
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathName).path
        if let results = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [DSA] {
            lists = results
        }
        
    }
    //create
    func addDSAItemToList(dsaItem: DSA) {
        lists.append(dsaItem)
    }
    //read
    func getLists() -> [DSA] {
        return lists
    }
    
    //update
    
    //delete
    
    
    
    
}
