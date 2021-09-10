/*:
 ## Practice simple Swift

 A set of exercises to try out the basic building blocks of the Swift language.
*/
 
 
/*:
 Basic operators: You decide to build a shed and want to know beforehand the area of your yard that it will take up. Create two constants, width and height, with values of 10 and 20, respectively. Create an area constant that is the result of multiplying the two previous constants together, and print out the result.
*/


/*:
 if statement: Write an if statement that prints "Big shed" if its area is greater than 100, otherwise prints "Little shed"
 */



/*:
 More complex if statement: Imagine you're going to dinner with friends and are struggling to decide where to go. Two of you have very strong opinions and have clearly laid out your requirements for dinner as follows:
 
 - You want to eat somewhere that has either fish or pizza
 - Your friend wants to eat somewhere with vegan options.
 
 Another friend brings up a restaurant she thinks will fit both of your criteria. This restaurant's attributes are represented by a few constants below. Write an if-else statement that will print "Let's go!" if the restaurant's attributes match the group's dietary requirements, and otherwise will print "Sorry, we'll have to think of somewhere else."
 */
 let hasFish = true
 let hasPizza = false
 let hasVegan = true


/*:
 Switch statement: Imagine you're on a baseball team nearing the end of the season. Create a `leaguePosition` constant with a value of 1. Using a `switch` statement, print "Champions!" if the `leaguePosition` is 1, "Runners up" if the value is 2, "Third place" if the value is 3, and "Bad season!" in all other cases.
 */


/*:
 String concatenation and interpolation: Create a `city` constant and assign it a string literal representing your home city. Then create a `country` constant and assign it a string literal representing your country. Finally, create a `home` constant and use string concatenation to assign it a string representing your home city and country (i.e. Lodon, England). Print the value of `home`.
 */


/*:
 Use the compound assignment operator (`+=`) to add `home` to `introduction` below. Print the value of `introduction`.
 */
var introduction = "I live in"


/*:
 String Comparison: Create two constants, `nameInCaps` and `name`. Assign `nameInCaps` your name as a string literal with proper capitalization. Assign `name` your name as a string literal in all lowercase. Write an if-else statement that checks to see if `nameInCaps` and `name` are the same. If they are, print "The two strings are equal", otherwise print "The two strings are not equal."
 */


/*:
 Write a new if-else statement that also checks to see if `nameInCaps` and `name` are the same. However, this time use the `lowercased()` method on each constant to compare the lowercase version of the strings. If they are equal, print the following statement using string interpolations:
 
 - "<INSERT LOWERCASED VERSION OF `nameInCaps` HERE> and <INSERT LOWERCASED VERSION OF `name` HERE> are the same."
 
 If they are not equal, print the following statement using string interpolation:
 
 - "<INSERT LOWERCASED VERSION OF `nameInCaps` HERE> and <INSERT LOWERCASED VERSION OF `name` HERE> are not the same."
 */


/*:
 Imagine you are looking through a list of names to find any that end in "Jr." Write an if statement below that will check if `junior` has the suffix "Jr.". If it does, print "We found a second generation name!"
 */
let junior = "Cal Ripken Jr."


/*:
 Arrays: Assume you are an event coordinator for a community charity event and are keeping a list of who has registered. Create a variable `registrationList` that will hold strings. It should be empty after initialization.
 */


/*:
 Your friend Sara is the first to register for the event. Add her name to `registrationList` using the `append` method. Print the contents of the collection.
 */


/*:
 Add four additional names into the array using the `+=` operator. All of the names should be added in one step. Print the contents of the collection.
 */


/*:
 Use the `insert(_:at:)` method to add `Charlie` into the array as the second element. Print the contents of the collection.
 */


/*:
 Someone had a conflict and decided to transfer her registration to someone else. Use array subscripting to change the sixth element to `Rebecca`. Print the contents of the collection.
 */


/*:
 Call `removeLast()` on `myArray`. If done correctly, this should remove `Rebecca` from the collection. Store the result of `removeLast()` into a new constant `deletedItem`, then print `deletedItem`.
 */

/* Loops: Write a loop to print out all the names that uses
          "for name in registrationList", then try it again by
          finding out how many elements are in registrationList,
          and looping on the index.
 */


