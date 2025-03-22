//
//  TrailEntity+CoreDataClass.swift
//  Traning
//
//  Created by Danil Viugov on 22.03.2025.
//
//

import Foundation
import CoreData

@objc(TrailEntity)
public class TrailEntity: NSManagedObject, Identifiable {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<TrailEntity> {
		return NSFetchRequest<TrailEntity>(entityName: "TrailEntity")
	}

	@NSManaged public var id: UUID
	@NSManaged public var name: String
	@NSManaged public var phase: String
	// TODO: - Сдлетаь тут массив понять отличие
	@NSManaged public var route: NSSet?

}

// MARK: Generated accessors for route
extension TrailEntity {

	@objc(addRouteObject:)
	@NSManaged public func addToRoute(_ value: RouteEntity)

	@objc(removeRouteObject:)
	@NSManaged public func removeFromRoute(_ value: RouteEntity)

	@objc(addRoute:)
	@NSManaged public func addToRoute(_ values: NSSet)

	@objc(removeRoute:)
	@NSManaged public func removeFromRoute(_ values: NSSet)

}

// MARK: - Init

extension TrailEntity {
	convenience init(model: Trail, context: NSManagedObjectContext) {
		self.init(context: context)
		self.id = model.id
		self.name = model.name
		self.phase = model.phase.rawValue
		model.route.forEach {
			addToRoute(RouteEntity(model: $0, context: context))
		}
	}
}
