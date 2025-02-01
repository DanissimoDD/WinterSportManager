//
//  Nationalities.swift
//  Traning
//
//  Created by Danil Viugov on 25.01.2025.
//

import Foundation
import SwiftUI

enum Nationalities: String {
	case Belgium
	case CzechRepublic
	case Denmark
	case Finland
	case France
	case Germany
	case Italy
	case Norway
	case Poland
	case Russia
	case Sweden
	case Switzerland
	case UK
	case Ukraine
	case Uzbekistan
	case unknown
	
	var flagImage: Image {
		Image(self.rawValue + "Flag")
	}
}
