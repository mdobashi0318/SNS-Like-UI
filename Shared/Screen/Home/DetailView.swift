//
//  DetailView.swift
//  SNS Like UI (iOS)
//
//  Created by 土橋正晴 on 2021/10/10.
//

import Foundation
import SwiftUI


struct DetailView: View {
        
    let model: HomeModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                nameHStak
                Spacer()
                detail
            }
        }
        .frame(width: width / 1.1, alignment: .leading)
        
    }
    
    var nameHStak: some View {
        HStack {
            Image(systemName: "person.circle")
            VStack(alignment: .leading) {
                Text(model.name)
                Text(model.id)
            }
        }
    }
    
    var detail: some View {
        Text(model.detail)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(model: HomeModel().fetch()[0])
    }
}
