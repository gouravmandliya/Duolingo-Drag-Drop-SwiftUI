//
//  DragView.swift
//  Duolingo
//
//  Created by GOURAVM on 22/08/22.
//

import SwiftUI

struct DragView: View {
    
    @ObservedObject var vm : QuestionViewModel
   
    var body: some View {
        VStack(spacing:12) {
            ForEach($vm.shuffledRows, id: \.self) { $row in
                HStack(spacing:10) {
                    ForEach($row) { $item in
                        Text(item.value)
                            .font(.system(size: item.fontSize))
                            .padding(.vertical,5)
                            .padding(.horizontal,item.padding)
                            .background {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .stroke(.gray)
                                    
                            }
                            .onDrag {
                                return .init(contentsOf:URL(string:item.id))!
                            }
                            
                            .opacity(item.isShowing ? 0 : 1)
                            .background {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .stroke(.gray)
                                    .opacity(item.isShowing ? 1 : 0)
                            }
                    }
                }
                if vm.shuffledRows.last != row {
                    Divider()
                }
            }
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView(vm: QuestionViewModel())
    }
}
