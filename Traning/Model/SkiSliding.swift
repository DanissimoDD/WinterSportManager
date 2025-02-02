//
//  SkiSliding.swift
//  Traning
//
//  Created by Danil Viugov on 18.03.2025.
//

import Foundation

enum SkiSliding: Int {
	case veryPoor      // Очень плохое скольжение
	case poor          // Плохое скольжение
	case fair          // Удовлетворительное скольжение
	case good          // Хорошее скольжение
	case veryGood      // Очень хорошее скольжение
	case excellent     // Отличное скольжение
	case perfect       // Идеальное скольжение
	
	var raceSliding: Double {
		switch self {
		case .veryPoor:
			0.95
		case .poor:
			0.955
		case .fair:
			0.97
		case .good:
			1
		case .veryGood:
			1.03
		case .excellent:
			1.045
		case .perfect:
			1.05
		}
	}
}


