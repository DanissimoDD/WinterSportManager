//
//  Trail.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import Foundation
import SwiftUI

struct Trail: Identifiable {
	let id: UUID = UUID()
	var name: String
	let distance: TrailDistance
	let height: TrailHeight
	
	var image: Image {
		Image("\(name)Image")
	}
}

enum TrailDistance {
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
}

enum TrailHeight {
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
			Trail(name: "Andorra", distance: .medium, height: .low)
		case .Croatia:
			Trail(name: "Croatia", distance: .short, height: .medium)
		case .Norway:
			Trail(name: "Norway", distance: .medium, height: .medium)
		case .Italy:
			Trail(name: "Italy", distance: .short, height: .high)
		case .France:
			Trail(name: "France", distance: .long, height: .medium)
		case .Estonia:
			Trail(name: "Estonia", distance: .short, height: .low)
		case .Germany:
			Trail(name: "Germany", distance: .medium, height: .medium)
		case .Hungary:
			Trail(name: "Hungary", distance: .long, height: .low)
		}
	}
}

