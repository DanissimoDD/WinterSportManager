//
//  RoutePart.swift
//  Traning
//
//  Created by Danil Viugov on 22.03.2025.
//

import Foundation

struct RoutePart: Hashable, Identifiable {
	let id: UUID
	let type: Terrain
	let distance: Double

	init(id: UUID = UUID(), type: Terrain, distance: Double) {
		self.id = id
		self.type = type
		self.distance = distance
	}

	init(entity: RouteEntity) {
		self.id = entity.id
		self.distance = entity.distance
		self.type = Terrain(rawValue: entity.type, scale: entity.typeValue)
	}
}
