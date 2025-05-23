//
//  AthletView.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import SwiftUI

struct AthletView: View {
	
	@Binding var bio: Bio
	
	var body: some View {
		HStack {
			AthleteImageView(bio: $bio)
			Text("\(bio.sourname), \(bio.name)").font(.system(size: 18, weight: .regular))
				.background(.clear)
		}
	}
}
