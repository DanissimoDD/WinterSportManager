//
//  AthleteImageView.swift
//  Traning
//
//  Created by Danil Viugov on 02.02.2025.
//

import SwiftUI

struct AthleteImageView: View {
	
	@Binding var bio: Bio
	
	var body: some View {
		ZStack {
			Image("AthletImage")
				.resizable()
				.frame(width: 48, height: 48)
				.cornerRadius(8)
			VStack {
				Spacer()
				HStack(alignment: .bottom) {
					bio.nationality.flagImage
						.resizable()
						.frame(width: 18, height: 18)
						.cornerRadius(4)
						.padding(.trailing, 12)
					Text("\(bio.age)")
						.font(.system(size: 12, weight: .semibold)) // Шрифт
						.foregroundColor(.black) // Цвет текста
						.padding(3) // Отступы внутри кружка
						.background(Circle().fill(Color.white)) // Круг с заливкой
						.overlay(Circle().stroke(Color.blue, lineWidth: 1))
				}.padding(.bottom, 2)
			}
		}
	}
}
