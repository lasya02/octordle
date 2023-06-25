//
//  GridView.swift
//  octordle
//
//  Created by Lasya Kambhampati on 6/23/23.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
            }
            HStack{
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
            }
            HStack{
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(.green)
                    .frame(width: 10, height: 10)
            }
            
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
