//
//  NaturalAbilitiesEntity+CoreDataClass.swift
//  Traning
//
//  Created by Danil Viugov on 31.01.2025.
//
//

import Foundation
import CoreData

@objc(NaturalAbilitiesEntity)
public class NaturalAbilitiesEntity: NSManagedObject, Identifiable {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<NaturalAbilitiesEntity> {
		return NSFetchRequest<NaturalAbilitiesEntity>(entityName: "NaturalAbilitiesEntity")
	}

	@NSManaged public var talent: Double
	@NSManaged public var hardWork: Double
	@NSManaged public var athlete: AthleteEntity?

}

// MARK: - Init

extension NaturalAbilitiesEntity {
	convenience init(model: NaturalAbilities, context: NSManagedObjectContext) {
		self.init(context: context)
		self.talent = model.talent
		self.hardWork = model.hardWork
	}
}
