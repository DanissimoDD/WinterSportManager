//
//  AcquredAbilitiesEntity+CoreDataClass.swift
//  Traning
//
//  Created by Danil Viugov on 31.01.2025.
//
//

import Foundation
import CoreData

@objc(AcquredAbilitiesEntity)
public class AcquredAbilitiesEntity: NSManagedObject, Identifiable {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<AcquredAbilitiesEntity> {
		return NSFetchRequest<AcquredAbilitiesEntity>(entityName: "AcquredAbilitiesEntity")
	}

	@NSManaged public var technik: Double
	@NSManaged public var experience: Double
	@NSManaged public var strength: Double
	@NSManaged public var stamina: Double
	@NSManaged public var athlete: AthleteEntity?

}
