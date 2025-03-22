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

// MARK: - Init

extension AthleteEntity {
	convenience init(model: Athlete, context: NSManagedObjectContext) {
		self.init(context: context)
		self.id = model.id
		self.overall = model.overall
		self.bio = BioEntity(model: model.bio, context: context)
		self.condition = SportConditionEntity(model: model.condition, context: context)
		self.naturalAbil = NaturalAbilitiesEntity(model: model.naturalAbilities, context: context)
		self.acquredAbil = AcquredAbilitiesEntity(model: model.acquiredAbilities, context: context)
	}
}
