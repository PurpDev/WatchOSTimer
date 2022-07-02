//
//  ContentView.swift
//  WatchOSTimer WatchKit Extension
//
//  Created by Augustin Diabira on 01/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var secondView = false
    @State var timePicked = 5
    
    var body: some View {
        VStack{
            
                Text("Start timer for \(timePicked) seconds").font(.system(size: 17))

            Picker(selection: $timePicked, label: Text("")) {
                ForEach(1..<26){timer in
                    Text("\(timer)").tag(timer)
                    
                    
                }
            }

            
            NavigationLink(destination: TimeView( secondView: $secondView, timePicked: timePicked) , isActive: $secondView, label: {Text("Start")})
           
        }
    }
}

struct TimeView: View {
    @Binding var secondView:Bool
    @State var timePicked:Int
    
    var body: some View {
        
        
        VStack{
            
            if timePicked > 0 {
                Text("Time remaining")
                    .font(.system(size: 14))
                Text("\(timePicked)")
                    .font(.system(size: 40))
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if timePicked > 0 {
                                timePicked -= 1
                            }
                        }
                }
                Text("seconds")
                    .font(.system(size: 14))
                Button(action: {
                    secondView = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            } else {
                Button(action: {
                    secondView = false
                }) {
                    Text("Done")
                        .foregroundColor(.green)
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


