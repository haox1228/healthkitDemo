//
//  ListView.swift
//  HealthKitDemo
//
//  Created by 马浩轩 on 10/27/22.
//

import SwiftUI

import SwiftUI

struct ListView: View {
	
	//formate the date
	static let dateFormatter: DateFormatter = {
		
		let formatter = DateFormatter()
		formatter.dateFormat = "MM/dd/hh"
		return formatter
		
	}()
	
	let steps: [Step]
	//a double to take the current total step
	let currentSteps: Double
	//a int to add up all the steps of the array of steps.
	var totalSteps: Int {
		steps.map { $0.count }.reduce(0,+)
	}
	
	
	var body: some View {
		VStack {
			List {
				
				ForEach(steps, id: \.id) { step in
					
					VStack {
						Text("\(step.date,formatter: Self.dateFormatter)")
							.font(.caption)
							.foregroundColor(Color.white)
						Text("\(step.count)")
							.font(.caption)
							.foregroundColor(Color.white)
						
					}
				}
				
			}
			
			Text("Current Steps of today: \(round(currentSteps))")
				.foregroundColor(Color.white)
				.opacity(0.5)
			
		}.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(Color(#colorLiteral(red: 0.2471546233, green: 0.4435939193, blue: 0.8302586079, alpha: 1)))
			.cornerRadius(10)
			.padding(10)
	}
}

