//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

@resultBuilder
public enum Builder<T> {

    public static func buildExpression(_ expression: T) -> [T] {
        return [expression]
    }

    public static func buildExpression(_ expression: [T]) -> [T] {
        return expression
    }

    public static func buildExpression(_ expression: T?) -> [T] {
        guard let expression = expression else { return [] }
        return [expression]
    }

    public static func buildBlock(_ children: [T]...) -> [T] {
        return children.flatMap { $0 }
    }

    public static func buildBlock(_ component: [T]) -> [T] {
        return component
    }

    public static func buildOptional(_ children: [T]?) -> [T] {
        return children ?? []
    }

    public static func buildEither(first child: [T]) -> [T] {
        return child
    }

    public static func buildEither(second child: [T]) -> [T] {
        return child
    }

    public static func buildArray(_ components: [[T]]) -> [T] {
        return components.flatMap { $0 }
    }
}
