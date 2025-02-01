//
//  AthleteEntity+CoreDataClass.swift
//  Traning
//
//  Created by Danil Viugov on 31.01.2025.
//
//

import Foundation
import CoreData

@objc(AthleteEntity)
public class AthleteEntity: NSManagedObject, Identifiable {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<AthleteEntity> {
		return NSFetchRequest<AthleteEntity>(entityName: "AthleteEntity")
	}

	@NSManaged public var id: UUID?
	@NSManaged public var overall: Double
	@NSManaged public var bio: BioEntity?
	@NSManaged public var condition: SportConditionEntity?
	@NSManaged public var naturalAbil: NaturalAbilitiesEntity?
	@NSManaged public var acquredAbil: AcquredAbilitiesEntity?

}
