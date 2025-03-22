//
//  TrailCases.swift
//  Traning
//
//  Created by Danil Viugov on 22.03.2025.
//

import Foundation

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
			Trail(name: "Estonia", route: [])
		case .Germany:
			Trail(name: "Germany", route: [])
		case .Hungary:
			Trail(name: "Hungary", route: [])
		}
	}
}
