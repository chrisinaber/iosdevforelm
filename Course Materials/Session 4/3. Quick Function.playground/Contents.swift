/*:
 ## Short Function Playground
*/

import Foundation

/*:
 Call the following functions
 */
 
func printHello() {
    print("Hello")
}

func printHello( name: String ) {
    print("Hello, \(name)")
}

func printHello(  and name: String ) {
    print("Hello, lovely \(name)")
}

func printHello( _ name: String ) {
    print("Hello, horrid \(name)")
}

/*:
 Call the following functions and print each part of the result
 */

func nameAndAge() -> (String, Int){
    return ("Jim", 23)
}




func listOfNames() -> [String] {
    return ["Jane", "Jill", "John", "Jean"]
}


/*:
 Write a magic 8 ball function that returns one of 8 random strings. Use Int.random(in: 0...7) to index into an array of 8 strings to do it.
 */




