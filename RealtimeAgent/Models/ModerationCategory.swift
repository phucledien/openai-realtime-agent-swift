//
//  ModerationCategory.swift
//  RealtimeAgent
//
//  Created by Oliver Le on 14/6/25.
//


public enum ModerationCategory: String {
    case offensive
    case offBrand
    case violence
    case none
    
    public var description: String {
        switch self {
        case .offensive: return "Offensive"
        case .offBrand: return "Off Brand"
        case .violence: return "Violence"
        case .none: return "None"
        }
    }
}
