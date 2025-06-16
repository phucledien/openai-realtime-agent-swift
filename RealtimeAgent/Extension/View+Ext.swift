//
//  View+Ext.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 15/6/25.
//

import SwiftUI

/**
 * - Fixme: ⚠️️ deprecate? yes!
 */
public struct NSRectCorner: OptionSet {
   public let rawValue: Int
   /**
    * - Parameter rawValue: 0 to 3
    */
   public init(rawValue: Int) {
      self.rawValue = rawValue
   }
}
/**
 * Constants
 * ## Examples:
 * let corners = [.topLeft, .topRight]
 */
extension NSRectCorner {
   public static let topLeft = NSRectCorner(rawValue: 1 << 0)
   public static let bottomLeft = NSRectCorner(rawValue: 1 << 1)
   public static let topRight = NSRectCorner(rawValue: 1 << 2)
   public static let bottomRight = NSRectCorner(rawValue: 1 << 3)
}

extension View {
    public func cornerRadius(_ radius: CGFloat, corners: NSRectCorner) -> some View {
        var topLeft: CGFloat = 0
        if corners.contains(.topLeft) {
            topLeft = radius
        }
            
        var topRight: CGFloat = 0
        if corners.contains(.topRight) {
            topRight = radius
        }

        var bottomLeft: CGFloat = 0
        if corners.contains(.bottomLeft) {
            bottomLeft = radius
        }

        var bottomRight: CGFloat = 0
        if corners.contains(.bottomRight) {
            bottomRight = radius
        }
        let cornerRadii = RectangleCornerRadii(topLeading: topLeft, bottomLeading: bottomLeft, bottomTrailing: bottomRight, topTrailing: topRight)
        
        return self.clipShape(
            UnevenRoundedRectangle(cornerRadii: cornerRadii)
        )
    }
    
    public func cursor(_ cursor: NSCursor) -> some View {
        self.onHover { inside in
            if inside {
                cursor.push()
            } else {
                NSCursor.pop()
            }
        }
    }
}
