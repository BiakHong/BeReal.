//
//  DateFormatExtensions.swift
//  BeReal Clone
//
//  Created by Lian Biak Hong on 3/24/23.
//


import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
