//
//  BioEntity+CoreDataClass.swift
//  Traning
//
//  Created by Danil Viugov on 31.01.2025.
//
//

import Foundation
import CoreData

@objc(BioEntity)
public class BioEntity: NSManagedObject, Identifiable {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<BioEntity> {
		return NSFetchRequest<BioEntity>(entityName: "BioEntity")
	}

	@NSManaged public var id: UUID?
	@NSManaged public var age: Int16
	@NSManaged public var name: String?
	@NSManaged public var sourname: String?
	@NSManaged public var nationality: String?
	@NSManaged public var atlethe: AthleteEntity?

}
