//
//  RouteEntity+CoreDataClass.swift
//  Traning
//
//  Created by Danil Viugov on 22.03.2025.
//
//

import Foundation
import CoreData

@objc(RouteEntity)
public class RouteEntity: NSManagedObject, Identifiable {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<RouteEntity> {
		return NSFetchRequest<RouteEntity>(entityName: "RouteEntity")
	}

	@NSManaged public var id: UUID
	@NSManaged public var type: String
	@NSManaged public var typeValue: Double
	@NSManaged public var distance: Double
	@NSManaged public var trail: TrailEntity

}

// MARK: - Init

extension RouteEntity {
	convenience init(model: RoutePart, context: NSManagedObjectContext) {
		self.init(context: context)
		self.id = model.id
		self.distance = model.distance
		self.type = model.type.rawValue
		switch model.type {
		case .ascent(let scale):
			self.typeValue = scale
		case .descent(let scale):
			self.typeValue = scale
		case .flat:
			self.typeValue = 1
		}
	}
}

