//
//  SeasonTrailView.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import SwiftUI

struct SeasonTrailView: View {
	@Binding var title: String
	
	var body: some View {
		ZStack {
			Image(title + "Image")
				.resizable()
				.frame(width: 108, height: 108, alignment: .center)
				.cornerRadius(12)
			VStack {
				Spacer()
				ZStack {
					Rectangle()
						.frame(width: 80, height: 20)
						.background(Color.white).opacity(0.3)
					Text(title).padding(.horizontal, 8).foregroundColor(.black)
				}.cornerRadius(10)
					.padding(.bottom, 2)
			}
		}
		.frame(width: 108, height: 108)
		.shadow(color: Color.black.opacity(0.3), radius: 5, x: 1, y: 0)
	}
}
