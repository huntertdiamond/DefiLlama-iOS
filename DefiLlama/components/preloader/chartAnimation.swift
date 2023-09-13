//
//  chartShimmerConfig.swift
//  DefiLlama
//
//  Created by Hunter Diamond on 9/12/23.
//

import Foundation
import SwiftUI

struct LineChartShape: Shape {
    var points: [CGPoint]
    var percent: CGFloat = 1.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard points.count > 1 else { return path }

        let pointCount = Int(CGFloat(points.count) * percent)
        guard pointCount > 1 else { return path }

        path.move(to: points[0])
        for i in 1..<min(pointCount, points.count) {
            let cp1 = CGPoint(x: (points[i].x + points[i-1].x)/2, y: points[i-1].y)
            let cp2 = CGPoint(x: (points[i].x + points[i-1].x)/2, y: points[i].y)
            path.addCurve(to: points[i], control1: cp1, control2: cp2)
        }

        return path
    }


    var animatableData: CGFloat {
        get { percent }
        set { percent = newValue }
    }
}

fileprivate struct ChartAnimationEffectHelper: ViewModifier {
    var config: ShimmerConfig

    @State private var animationProgress: CGFloat = 0.0

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height

                    let pointCount = 100
                    let volatility: CGFloat = 0.1
                    var lastY: CGFloat = 0.6
                    let points: [CGPoint] = (0..<pointCount).map { index -> CGPoint in
                        let x = CGFloat(index) / CGFloat(pointCount - 1) * width
                        let randomFluctuation = CGFloat.random(in: -volatility...volatility)
                        
                        // Creating a general upward trend while adding random fluctuations
                        let y = height * (min(max(lastY + randomFluctuation, 0.12), 0.8))
                        
                        // Saving last y value for the next point
                        lastY = y / height
                        
                        return CGPoint(x: x, y: y)
                    }



                    LineChartShape(points: points, percent: animationProgress)
                        .stroke(config.highlight, lineWidth: 4)
                        .onAppear {
                            withAnimation(.linear(duration: Double(config.speed * 1.2)).repeatForever(autoreverses: false)) {
                                animationProgress = 1.0
                            }
                        }
                }
            }
    }
}



extension View {
    @ViewBuilder
    func chartAnimation(_ config: ShimmerConfig) -> some View {
        self
            .modifier(ChartAnimationEffectHelper(config: config))
    }
}

