//
//  Binding+Hashable.swift
//  Traning
//
//  Created by Danil Viugov on 23.03.2025.
//

import Foundation
import SwiftUI

extension Binding: /*@retroactive*/ Hashable where Value: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.wrappedValue.hashValue)
	}
}

extension Binding: /*@retroactive*/ Equatable where Value: Equatable {
	public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
		lhs.wrappedValue == rhs.wrappedValue
	}
}
