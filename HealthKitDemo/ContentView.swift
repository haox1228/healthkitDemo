/*
 This is the main page of the app
 */
import SwiftUI
import HealthKit

struct ContentView: View {
	
	private var healthStore: HealthStore?
	//two state variable used to store the array of step and double of the current step
	@State private var steps: [Step] = [Step]()
	@State private var currentSteps: Double
	init() {
		healthStore = HealthStore()
		currentSteps = 0
	}
	//this part will decode the healthkit collection to a step array
	private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
		let date = Date()
		let cal = Calendar(identifier: .gregorian)
		let startDate = cal.startOfDay(for: date)
		let endDate = Date()
		
		statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
			
			let count = statistics.sumQuantity()?.doubleValue(for: .count())
			
			let step = Step(count: Int(count ?? 0), date: statistics.startDate)
			steps.append(step)
		}
		
		
	}
	
	
	var body: some View {
		
		NavigationView {
			
			ListView(steps: steps, currentSteps: currentSteps)
			
				.navigationTitle("HealthKit Demo")
		}
		
		
		.onAppear {
			/*
			 The following part set that all the content will only be displayed if the user grant acess
			 */
			if let healthStore = healthStore {
				//if authorization works
				healthStore.requestAuthorization { success in
					if success {
						//we fetch the steps
						healthStore.fetchSteps { statisticsCollection in
								//unwrap it
							if let statisticsCollection = statisticsCollection {
								// decode it
								updateUIFromStatistics(statisticsCollection)
							}
							
						}
						//we get the current step
						healthStore.getSteps { unwrapp in
							
							currentSteps = unwrapp
							
						}
						
						
					}
				}
			}
		}
		
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
