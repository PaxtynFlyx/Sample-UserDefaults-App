//
//  View+NSLayoutAnchor.swift
//  Auto Layout Constraint App
//
//  Created by Nuri Chun on 7/31/21.
//

import UIKit

enum AnchorPositionType {
    case top(anchor: NSLayoutYAxisAnchor?, padding: CGFloat? = nil)
    case left(anchor: NSLayoutXAxisAnchor?, padding: CGFloat? = nil)
    case bottom(anchor: NSLayoutYAxisAnchor?, padding: CGFloat? = nil)
    case right(anchor: NSLayoutXAxisAnchor?, padding: CGFloat? = nil)
}

extension UIView {
    
    // Anchor all sides to fill
    func fillToSuperView() {
        guard let superview = self.superview else {
            print("SuperView was nil.")
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
    }
    
    // Anchor to sides
    func anchor(toView anchorTypes: [AnchorPositionType]) {
        translatesAutoresizingMaskIntoConstraints = false
        
        for anchor in anchorTypes {
            switch anchor {
            case let .top(anchor, padding):
                if let anchor = anchor {
                    topAnchor.constraint(equalTo: anchor, constant: padding ?? 0).isActive = true
                }
            case let .left(anchor, padding):
                if let anchor = anchor {
                    leadingAnchor.constraint(equalTo: anchor, constant: padding ?? 0).isActive = true
                }
            case let .bottom(anchor, padding):
                if let anchor = anchor {
                    if let padding = padding {
                        bottomAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
                    } else {
                        bottomAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
                    }
                }
            case let .right(anchor, padding):
                if let anchor = anchor {
                    if let padding = padding {
                        trailingAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
                    } else {
                        trailingAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
                    }
                }
            }
        }
    }
    
    // Anchor to sides with dimensional input (width, height)
    func anchorDimensions(toView anchorTypes: [AnchorPositionType]? = [], size: CGSize = .zero) {
        guard let anchorTypes = anchorTypes else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        for anchor in anchorTypes {
            switch anchor {
            case let .top(anchor, padding):
                if let anchor = anchor {
                    topAnchor.constraint(equalTo: anchor, constant: padding ?? 0).isActive = true
                }
            case let .left(anchor, padding):
                if let anchor = anchor {
                    leadingAnchor.constraint(equalTo: anchor, constant: padding ?? 0).isActive = true
                }
            case let .bottom(anchor, padding):
                if let anchor = anchor {
                    if let padding = padding {
                        bottomAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
                    } else {
                        bottomAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
                    }
                }
            case let .right(anchor, padding):
                if let anchor = anchor {
                    if let padding = padding {
                        trailingAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
                    } else {
                        trailingAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
                    }
                }
            }
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    // Centers the view on both X & Y-Axis
    func centerXY() {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else {
            return
        }
        
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    // Centers the view on the X-Axis
    func centerX() {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else {
            return
        }
        
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
    
    // Centers the view on the Y-Axis
    func centerY() {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else {
            return
        }
        
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
