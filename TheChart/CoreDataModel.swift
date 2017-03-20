//
//  CoreDataModel.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/17/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import Foundation
import CoreData


final class CoreDataModel {
    
    static let shared = CoreDataModel()
    var children = [Child]()
    
    private static let name = "TheChart"
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataModel.name)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Error: \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error: \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch() {
        
        let request = NSFetchRequest<Child>(entityName: "Child")
        
        do { let childs = try context.fetch(request)
            children = childs
            
        } catch {
            print ("error")
        }
        
    }
    
}

extension Child {
    
    public override var description: String {
        return "Name: \(name), Age: \(age)"
    }
}
