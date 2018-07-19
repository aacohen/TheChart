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
    var chores = [Chore]()
    
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
    
    func fetchChore(child1: Child) {
        
        let predicate = NSPredicate(format: "child = %@", argumentArray: [child1])
        let request = NSFetchRequest<Chore>(entityName: "Chore")
        request.predicate = predicate
        
        do { let chore = try context.fetch(request)
            chores = chore
            
        } catch {
            print ("error")
        }
        
    }
    
    func delete(indexPath: IndexPath) {
        
        context.delete(children[indexPath.row] as NSManagedObject)
        
          //Do the chores associated with the Child get deleted as well?
        
//        context.delete(chores[indexPath.row] as NSManagedObject)
//        chores.remove(at: indexPath.row)
        
      
        children.remove(at: indexPath.row)
        saveContext()
    }
    
}

extension Child {
    
    public override var description: String {
        return "Name: \(String(describing: name)), Age: \(String(describing: age))"
    }
}
