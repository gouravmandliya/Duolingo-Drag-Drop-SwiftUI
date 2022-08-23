//
//  ProgressView.swift
//  Duolingo
//
//  Created by GOURAVM on 22/08/22.
//

import SwiftUI

struct ProgressView: View {
    
    @ObservedObject var vm : QuestionViewModel
    
    var body: some View {
        HStack(spacing:18){
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            
            GeometryReader { proxy in
                ZStack(alignment:.leading){
                    Capsule()
                        .fill(.gray.opacity(0.25))
                    Capsule()
                        .fill(Color("ProgressColor"))
                        .frame(width: proxy.size.width * vm.progress)
                        .animation(.default, value: vm.progress)
                }
            }
            .frame(height:20)
            
            Button {
                
            } label: {
                Image(systemName: "suit.heart.fill")
                    .font(.title3)
                    .foregroundColor(.red)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(vm: QuestionViewModel())
    }
}
