//
//  DynamicCollectionlistView.swift
//  ACCompany
//
//  Created by Thangarajan K on 19/06/24.
//

import SwiftUI

struct DynamicCollectionlistView: View {
    @State var list = [String]()
    @State var selectedItems = [String]()
    var isLocation:Bool = false
    var isBudget:Bool = false
    var submitButtonAction: (_ action: Any)->Void
   
    
    var body: some View {

        VStack(alignment: .leading, spacing: 12) {
            HStack {
            FlowLayout {
                ForEach(list, id: \.self) { item in
                    HStack {
                        Text(item)
                            .fixedSize()
                            .font(.montserratMedium(size: 14))
                            .foregroundStyle(isLocation ? selectedItems.contains(item) ? Color.purbleColor():Color.black:Color.black)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: isLocation ? selectedItems.contains(item) ? 0:16:16))
                        if isLocation {
                            if selectedItems.contains(item) {
                                Image("Cancel")
                                    .resizable()
                                    .frame(width: 12,height: 12)
                                    .colorMultiply(.purbleColor())
                                    .padding(.trailing, 16)
                                    .onTapGesture(perform: {
                                        if let index = selectedItems.firstIndex(of: item) {
                                            selectedItems.remove(at: index)
                                            submitButtonAction(selectedItems)
                                        }
                                    })
                            }
                        }
                    }
                    .frame(height: 32)
                    .background(
                        Capsule().stroke(isLocation ? selectedItems.contains(item) ? .purbleColor():Color.borderColor225():Color.borderColor225()).fill(isLocation ? selectedItems.contains(item) ? Color.purple2():.white:.white)
                    )
                    .padding(.horizontal, 6)
                    .onTapGesture(perform: {
                        if selectedItems.count < 5 && !selectedItems.contains(item) {
                            selectedItems.append(item)
                        }
                        submitButtonAction(isLocation ? selectedItems : item)
                        
                    })
                }
                .padding(.bottom, 12)
                if !isBudget {
                    Button(action: {
                        
                    }, label: {
                        Text(Constants.showMore)
                            .font(.montserratRegular(size: 12))
                            .underline()
                            .foregroundStyle(Color.black)
                        
                    })
                    .padding(.top, 8)
                    
                }
            }
                Spacer()
        }
            
        }
        
    }
}


struct FlowLayout: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }

        var totalHeight: CGFloat = 0
        var totalWidth: CGFloat = 0

        var lineWidth: CGFloat = 0
        var lineHeight: CGFloat = 0

        for size in sizes {
            if lineWidth + size.width > proposal.width ?? 0 {
                totalHeight += lineHeight
                lineWidth = size.width
                lineHeight = size.height
            } else {
                lineWidth += size.width
                lineHeight = max(lineHeight, size.height)
            }

            totalWidth = max(totalWidth, lineWidth)
        }

        totalHeight += lineHeight

        return .init(width: totalWidth, height: totalHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }

        var lineX = bounds.minX
        var lineY = bounds.minY
        var lineHeight: CGFloat = 0

        for index in subviews.indices {
            if lineX + sizes[index].width > (proposal.width ?? 0) {
                lineY += lineHeight
                lineHeight = 0
                lineX = bounds.minX
            }

            subviews[index].place(
                at: .init(
                    x: lineX + sizes[index].width / 2,
                    y: lineY + sizes[index].height / 2
                ),
                anchor: .center,
                proposal: ProposedViewSize(sizes[index])
            )

            lineHeight = max(lineHeight, sizes[index].height)
            lineX += sizes[index].width
        }
    }
}
