//
//  SportConditionEntity+CoreDataClass.swift
//  Traning
//
//  Created by Danil Viugov on 31.01.2025.
//
//

import Foundation
import CoreData

@objc(SportConditionEntity)
public class SportConditionEntity: NSManagedObject, Identifiable {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<SportConditionEntity> {
		return NSFetchRequest<SportConditionEntity>(entityName: "SportConditionEntity")
	}

	@NSManaged public var physical: Double
	@NSManaged public var breath: Double
	@NSManaged public var mental: Double
	@NSManaged public var health: Double
	@NSManaged public var athlete: AthleteEntity?

}
