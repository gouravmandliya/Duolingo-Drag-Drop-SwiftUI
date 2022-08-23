//
//  Home.swift
//  Duolingo
//
//  Created by GOURAVM on 22/08/22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var vm = QuestionViewModel()
    
    var body: some View {
        VStack(spacing:0) {
            ProgressView(vm: vm)
            VStack(alignment: .center, spacing: 30) {
                Text("Form this sentence")
                    .font(.title3.bold())
                Image("good")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:.infinity, maxHeight:.infinity)
                DropView(vm: vm)
                    .padding(.vertical,30)
                DragView(vm: vm)
            }
            .padding(.top,30)
        }
        .padding()
        .onAppear {
            vm.shuffleArray()
        }
        .offset(x: vm.animateWrongText ? -30 : 0)
        .environmentObject(vm)
    }
    
    

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
