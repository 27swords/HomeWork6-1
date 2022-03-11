//
//  main.swift
//  HomeWork6-1
//
//  Created by Alexander Chervoncev on 7.03.22.
//

import Foundation

struct Queue<T> {
    
    private var line = [T]()
    
    //Adding an element
    mutating func push(element: T) {
        line.append(element)
    }
    //Deleting an element
    mutating func pop() -> T? {
        return line.removeLast()
   }
    //Filtering function
    func filtering(make:(T) -> Bool) -> [T] {
        
        var result = [T]()
        
        for i in line {
            if make(i) {
                result.append(i)
            }
        }
        return result
    }

    func status() {
        line.isEmpty ? print("Empty") : print(" Количество элементов: \(line.count), \n Элементы очереди: \(line)")
    }
    //Output to the console
    subscript(index: Int) -> T? {
        
        get {
            guard line.count <= index else { return line[index] }
            
            return nil
        }
        set (newValue) {
            guard let newValue = newValue else { return }
            guard line.count != index && line.count >= index else { return print("Индекс вне диапозона") }
            self.line[index] = newValue
        }
    }
}

var stringQueue = Queue<String>()

stringQueue.push(element: "Alex")
stringQueue.push(element: "John")
stringQueue.push(element: "Sophia")
stringQueue.push(element: "Abigail")
stringQueue.push(element: "Emily")
stringQueue.push(element: "Mia")
stringQueue.push(element: "Olivia")
stringQueue.push(element: "Sophia")
stringQueue.status()

let pushQueue = stringQueue.pop()
print(pushQueue!)
let popQueue = stringQueue.pop()
print(popQueue!)

var intQueue = Queue<Int>()

intQueue.push(element: 15)
intQueue.push(element: 13)
intQueue.push(element: 20)
intQueue.push(element: 14)
intQueue.push(element: 1)
intQueue.push(element: 4)
intQueue.push(element: 43)
intQueue.push(element: 12)

print("Четные в очереди")
print(intQueue.filtering(make: { $0 % 2 == 0 }))
print("Нечетные в очереди")
print(intQueue.filtering(make: { $0 % 2 != 0 }))


