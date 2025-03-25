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
					RoutePart(type: .flat, distance: 700),
					RoutePart(type: .ascent(scale: 1.5), distance: 300),
					RoutePart(type: .flat, distance: 600),
					RoutePart(type: .ascent(scale: 1.1), distance: 1000),
					RoutePart(type: .descent(scale: 1.6), distance: 600),
					RoutePart(type: .flat, distance: 300)
				]
			)
		case .Italy:
			Trail(
				name: "Italy",
				route: [
					RoutePart(type: .flat, distance: 500),
					RoutePart(type: .descent(scale: 1.2), distance: 900),
					RoutePart(type: .ascent(scale: 1.3), distance: 500),
					RoutePart(type: .flat, distance: 800),
					RoutePart(type: .ascent(scale: 1.1), distance: 1200),
					RoutePart(type: .flat, distance: 1000)
				]
			)
		case .France:
			Trail(
				name: "France",
				route: [
					RoutePart(type: .flat, distance: 500),
					RoutePart(type: .descent(scale: 1.3), distance: 900),
					RoutePart(type: .ascent(scale: 1.1), distance: 1000),
					RoutePart(type: .flat, distance: 700),
					RoutePart(type: .ascent(scale: 1.2), distance: 600),
					RoutePart(type: .descent(scale: 1.1), distance: 800),
					RoutePart(type: .flat, distance: 700)
				]
			)
		case .Estonia:
			Trail(
				name: "Estonia",
				route: [
					RoutePart(type: .flat, distance: 900),
					RoutePart(type: .ascent(scale: 1.3), distance: 1800),
					RoutePart(type: .descent(scale: 1.4), distance: 1500),
					RoutePart(type: .flat, distance: 400)
				]
			)
		case .Germany:
			Trail(
				name: "Germany",
				route: [
					RoutePart(type: .flat, distance: 1600),
					RoutePart(type: .descent(scale: 1.4), distance: 500),
					RoutePart(type: .flat, distance: 1400),
					RoutePart(type: .ascent(scale: 1.2), distance: 900),
					RoutePart(type: .descent(scale: 1.3), distance: 500),
				]
			)
		case .Hungary:
			Trail(
				name: "Hungary",
				route: [
					RoutePart(type: .flat, distance: 200),
					RoutePart(type: .descent(scale: 1.1), distance: 700),
					RoutePart(type: .flat, distance: 1200),
					RoutePart(type: .ascent(scale: 1.6), distance: 300),
					RoutePart(type: .flat, distance: 1300),
					RoutePart(type: .ascent(scale: 1.2), distance: 1000),
					RoutePart(type: .flat, distance: 400)
				]
			)
		}
	}
}
