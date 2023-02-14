//
//  ContentView.swift
//  DecimalToBinaryTest
//
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("Decimal to Binary")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom);
            NavigationLink(destination: About()) {
                Text("About")
                    .padding(.all)
            }
            NavigationLink(destination: Test()) {
                Text("Test")
                    .padding(.all)
            }
        }.navigationBarBackButtonHidden(true);
    }
}

struct About: View {
    var body: some View {
        VStack {
            Text("Created by Cameron Armstrong")
                .font(.title2)
                .fontWeight(.light)
                .padding(.bottom, 20.0)
            
            NavigationLink(destination: Home()) {
                Text("Return")
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Leaderboard: View {
    var body: some View {
        VStack {
            Text("Leaderboard")
                .fontWeight(.light)
                .font(.title)
        }.navigationBarBackButtonHidden(true);
    }
}

struct Test: View {
    @State private var score: Int = 0;
    @State private var limit: Int = 10;
    @State private var binLimit: Int = 128;
    @State private var timesPressed: Int = 0;
    @State private var toConvert: Int = Int.random(in: 1...128);
    @State private var currentButton: Int = Int.random(in: 0..<4);
    
    func reset() {
        timesPressed = 0;
        toConvert = Int.random(in: 1...binLimit);
        currentButton = Int.random(in: 0..<4);
        score = 0;
    }
    
    func answer(incomingPress: Int) {
        // Add to score if correct
        if incomingPress == currentButton {
            score += 1;
        }
        
        // update record
        if UserDefaults.standard.integer(forKey: "personalBest") < score {
            UserDefaults.standard.set(score, forKey: "personalBest");
        }
        
        timesPressed += 1;
        // End Game
        if timesPressed >= limit {
            return;
        }

        // Generate new numbers
        self.toConvert = Int.random(in: 1...binLimit);
        self.currentButton = Int.random(in: 0..<4);
    }
    
    var body: some View {
        if timesPressed != limit {
            ZStack {
                Image(String(timesPressed + 1))
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Convert " + String(toConvert) + " to binary")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold);
                    HStack {
                        Button(action: {
                            answer(incomingPress: 0);
                        }) {
                            if currentButton == 0 {
                                Text(String(toConvert, radix: 2))
                                    .foregroundColor(.green);
                            } else {
                                Text(String((toConvert + Int.random(in: 1...20)), radix: 2))
                                    .foregroundColor(.green);
                            }
                        }.padding(.all);
                        Button(action: {
                            answer(incomingPress: 1);
                        }) {
                            if currentButton == 1 {
                                Text(String(toConvert, radix: 2))
                                    .foregroundColor(.blue);
                            } else {
                                Text(String((toConvert + Int.random(in: 1...20)), radix: 2))
                                    .foregroundColor(.blue);
                            }
                        }.padding(.all);
                    }
                    HStack {
                        Button(action: {
                            answer(incomingPress: 2);
                        }) {
                            if currentButton == 2 {
                                Text(String(toConvert, radix: 2))
                                    .foregroundColor(.red);
                            } else {
                                Text(String((toConvert + Int.random(in: 1...20)), radix: 2))
                                    .foregroundColor(.red);
                            }
                        }.padding(.all);
                        Button(action: {
                            answer(incomingPress: 3);
                        }) {
                            if currentButton == 3 {
                                Text(String(toConvert, radix: 2))
                                    .foregroundColor(.yellow);
                            } else {
                                Text(String((toConvert + Int.random(in: 1...20)), radix: 2))
                                    .foregroundColor(.yellow);
                            }
                        }.padding(.all);
                    }
                }
                .padding(.all, 60.0)
                .background(Color(red: 10/255, green: 10/255, blue: 10/255))
            }
            .disabled(timesPressed >= limit)
            .navigationBarBackButtonHidden(true)
            .zIndex(1.0);
        } else {
            ZStack {
                VStack {
                    Text("Congratulations! You got \(score) out of \(limit) correct")
                        .multilineTextAlignment(.center)
                        .padding(.all, 50.0)
                        .font(.title)
                        .fontWeight(.light);
                    Text("Current Record: \(UserDefaults.standard.integer(forKey: "personalBest"))")
                        .multilineTextAlignment(.center)
                        .padding(.all, 20.0)
                        .font(.title3)
                        .fontWeight(.light);
                    Button(action: {
                        reset();
                    }) {
                        Text("Play Again");
                    }.padding(.all)
                    NavigationLink(destination: Home()) {
                        Text("Main Menu")
                    }.padding(.all)
                }.navigationBarBackButtonHidden(true)
            }.zIndex(5.0);
        }
    }
}


struct DTBApp: View {
    var body: some View {
        VStack {
            NavigationStack {
                Home();
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct DTBApp_Previews: PreviewProvider {
    static var previews: some View {
        DTBApp()
    }
}
