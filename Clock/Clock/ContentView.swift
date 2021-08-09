//
//  ContentView.swift
//  Clock
//
//  Created by Rakesh Patole on 09/08/21.
//

import SwiftUI
import Combine

class ClockViewModel: ObservableObject {
    @Published var hourHandDegrees: CGFloat = 0
    @Published var minHandDegrees: CGFloat = 0
    @Published var secHandDegrees: CGFloat = 0
    
    var ticks: TimeInterval {
        didSet {
            let secondsInADay = 86400.0
            let secondsToday = ticks.truncatingRemainder(dividingBy: secondsInADay)
            let secondsInCurrentMin = secondsToday.truncatingRemainder(dividingBy: 60)
            let minsToday = secondsToday/60
            let minsInCurrentHour = minsToday.truncatingRemainder(dividingBy: 60)
            let hoursToday = minsToday/60
            let hoursInThisHalf = hoursToday.truncatingRemainder(dividingBy: 12)
            
            
            secHandDegrees = secondsInCurrentMin * (360/60)
            minHandDegrees = minsInCurrentHour * (360/60)
            hourHandDegrees = hoursInThisHalf * (360/12)
        }
    }
    var cancellable: Cancellable!
    
    public init() {
        self.ticks = ClockViewModel.ticksInCurrentTimeZone(date: Date())
        cancellable = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { [weak self] date in
                self?.ticks = ClockViewModel.ticksInCurrentTimeZone(date: date)
            })
    }
    
    private static func ticksInCurrentTimeZone( date: Date) -> TimeInterval {
        return Double(TimeZone.current.secondsFromGMT(for: date)) + date.timeIntervalSince1970
    }
}

struct ContentView: View {
    @StateObject var viewModel = ClockViewModel()
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black)
                    .frame( width: 220, height: 220)
                
                Circle()
                    .fill(Color.white)
                    .frame( width: 200, height: 200)
            }
            
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame( width: 20, height: 20)
                
                Rectangle()
                    .fill(Color.black)
                    .offset(x: 0, y: -30)
                    .rotationEffect(Angle(degrees: viewModel.hourHandDegrees))
                    .frame( width: 4, height: 60)
                
                Circle()
                    .fill(Color.gray)
                    .frame( width: 15, height: 15)
                
                Rectangle()
                    .fill(Color.gray)
                    .offset(x: 0, y: -45)
                    .rotationEffect(Angle(degrees: viewModel.minHandDegrees))
                    .frame( width: 2, height: 90)
                
                Circle()
                    .fill(Color.orange)
                    .frame( width: 10, height: 10)
                
                Rectangle()
                    .fill(Color.orange)
                    .offset(x: 0, y: -35)
                    .rotationEffect(Angle(degrees: viewModel.secHandDegrees))
                    .frame( width: 2, height: 70)
            }
            
            ZStack{
                Text("12")
                    .position(x: 110, y: 20)
                
                Text("3")
                    .position(x: 200, y: 110)
                
                Text("6")
                    .position(x: 110, y: 200)
                
                Text("9")
                    .position(x: 20, y: 110)
            }
        }.frame( width: 220, height: 220)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
