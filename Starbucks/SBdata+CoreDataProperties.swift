//
//  SBdata+CoreDataProperties.swift
//  Starbucks
//
//  Created by Naina Sai Tipparti on 4/24/17.
//  Copyright © 2017 Naina Sai Tipparti. All rights reserved.
//

import Foundation
import CoreData


extension SBdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SBdata> {
        return NSFetchRequest<SBdata>(entityName: "SBdata")
    }

    @NSManaged public var id: String?
    @NSManaged public var place_id: String?
    @NSManaged public var vicinity: String?

}
