//
//  ContentView.swift
//  TwitterSplashScreen
//
//  Created by Selen Yanar on 20.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate = false
    @State var endSplash = false
    
    
    var body: some View {
        ZStack {
            
            Home()
            
            ZStack {
                
                Color("bg")
                
                Image("twitterlarge")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                    
                    //scaling view...
                    .scaleEffect(animate ? 3 : 1)
                    // setting width to avoid oversize...
                    .frame(width: UIScreen.main.bounds.width)
                
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            //Hiding view after finished...
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            withAnimation(Animation.easeOut(duration: 0.55)) {
                
                animate.toggle()
                
            }
            
            withAnimation(Animation.linear(duration: 0.45)) {
                
                endSplash.toggle()
                
            }
            
        }
    }
    
    struct Home: View {
        var body: some View {
            
            VStack {
                
                HStack {
                    
                    
                    Text("Twitter")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("bg"))
                
                    
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
            }
            .ignoresSafeArea(.all, edges: .all)
            .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
