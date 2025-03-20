//
//  Trail.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import Foundation
import SwiftUI

struct Trail: Identifiable, Hashable {
	
	let id: UUID = UUID()
	var name: String
	let distance: TrailDistance
	let height: TrailHeight
	var route: [RoutePart]

	var image: Image {
		Image("\(name)Image")
	}
}

enum TrailDistance: Hashable {
	case short
	case medium
	case long

	var description: String {
		switch self {
		case .short:
			"КОРОТКАЯ"
		case .medium:
			"СРЕДНЯЯ"
		case .long:
			"ДЛИННАЯ"
		}
	}
	
	var efficiency: Double {
		switch self {
		case .short:
			0.8
		case .medium:
			1.6
		case .long:
			2.4
		}
	}
}

enum TrailHeight: Hashable {
	case low
	case medium
	case high
	
	var description: String {
		switch self {
		case .low:
			"НИЗКОГОРЬЕ"
		case .medium:
			"СРЕДНЕГОРЬЕ"
		case .high:
			"ВЫСОКОГОРЬЕ"
		}
	}
	
	
	var efficiency: Double {
		switch self {
		case .low:
			0.8
		case .medium:
			1.6
		case .high:
			2.4
		}
	}
}

enum TrailCases: CaseIterable {
	case Andorra
	case Croatia
	case Norway
	case Italy
	case France
	case Estonia
	case Germany
	case Hungary
	
	var details: Trail {
		switch self {
		case .Andorra:
			Trail(
				name: "Andorra",
				distance: .medium,
				height: .low,
				route: [
					RoutePart(type: .flat, distance: 1200),
					RoutePart(type: .ascent(scale: 1.2), distance: 850), // 1950
					RoutePart(type: .descent(scale: 1.1), distance: 550), // 2500
					RoutePart(type: .ascent(scale: 1.3), distance: 500), // 3000
					RoutePart(type: .flat, distance: 1000), // 4000
					RoutePart(type: .descent(scale: 1.2), distance: 800), // 4800
					RoutePart(type: .flat, distance: 1100) // 5900
				]
			)
		case .Croatia:
			Trail(
				name: "Croatia",
				distance: .short,
				height: .medium,
				route: [
					RoutePart(type: .flat, distance: 1800),
					RoutePart(type: .ascent(scale: 1.3), distance: 1300), // 3100
					RoutePart(type: .flat, distance: 800), // 3900
					RoutePart(type: .ascent(scale: 1.2), distance: 900), // 4800
					RoutePart(type: .descent(scale: 1.6), distance: 1000), // 5800
					RoutePart(type: .flat, distance: 500) // 6300
				]
			)
		case .Norway:
			Trail(
				name: "Norway",
				distance: .medium,
				height: .medium,
				route: [
					RoutePart(type: .flat, distance: 0.7),
					RoutePart(type: .ascent(scale: 1.5), distance: 0.3),
					RoutePart(type: .flat, distance: 0.6),
					RoutePart(type: .ascent(scale: 1.1), distance: 0.7),
					RoutePart(type: .descent(scale: 1.6), distance: 0.4),
					RoutePart(type: .flat, distance: 0.3)
				]
			)
		case .Italy:
			Trail(
				name: "Italy",
				distance: .short,
				height: .high,
				route: [
					RoutePart(type: .flat, distance: 0.5),
					RoutePart(type: .descent(scale: 1.2), distance: 0.4),
					RoutePart(type: .ascent(scale: 1.3), distance: 0.3),
					RoutePart(type: .flat, distance: 0.4),
					RoutePart(type: .ascent(scale: 1.1), distance: 0.7),
					RoutePart(type: .flat, distance: 0.3)
				]
			)
		case .France:
			Trail(
				name: "France",
				distance: .long,
				height: .medium,
				route: [
					RoutePart(type: .flat, distance: 0.3),
					RoutePart(type: .descent(scale: 1.3), distance: 0.8),
					RoutePart(type: .ascent(scale: 1.1), distance: 0.6),
					RoutePart(type: .flat, distance: 0.9),
					RoutePart(type: .ascent(scale: 1.2), distance: 0.6),
					RoutePart(type: .descent(scale: 1.1), distance: 0.8),
					RoutePart(type: .flat, distance: 0.8)
				]
			)
		case .Estonia:
			Trail(name: "Estonia", distance: .short, height: .low, route: [])
		case .Germany:
			Trail(name: "Germany", distance: .medium, height: .medium, route: [])
		case .Hungary:
			Trail(name: "Hungary", distance: .long, height: .low, route: [])
		}
	}
}

struct RoutePart: Hashable, Identifiable {
	let id = UUID()
	let type: Terrain
	let distance: Double
}

enum Terrain: Hashable {
	case ascent(scale: Double)
	case flat
	case descent(scale: Double)
}
