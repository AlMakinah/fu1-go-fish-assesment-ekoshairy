# Go Fish 

You met a special agent, and in order to extract information from him, you're going to play a game of go fish. Today we're going to implement that game.

To play the game, and know the rules, check out [Go Fish](https://cardgames.io/gofish/)



You've already created **Card** and **Card Deck** classes, and you'll be using them in this exercise.

Clone this Repo and let's get started.

You'll find 4 classes:

* Card
* Card Deck
* Player
* Go Fish


We're going to start out by implementing small helper methods that will assist us in this exercise. For each section, make sure all the tests are passing. You'll find Ex1 - 4 in helper.rb

To run the tests: rspec spec/helper_spec

REMEMBER:
=========

Refer to the Ruby documentation and use the available methods to simplify your solution and save your time. 

This assignment can be simplified if you make use of:

1. http://ruby-doc.org/core-2.4.0/Comparable.html
2. http://ruby-doc.org/core-2.4.0/Array.html#method-i-sort
3. http://ruby-doc.org/core-2.4.0/Array.html#method-i-shuffle

### Exercise 1

Create a method, that takes as input an array, and sorts it. 

### Exercise 2

Create a method, that takes as input a sorted array, and inserts an element into that array keeping it sorted.

### Exercise 3

Create a method that given a sorted array, searches for an element in that array.

### Exercise 4

We would like to shuffle a stack with the help of 2 other stacks. How would you do that? Think of how you shuffle a card deck.

### Exercise 5

Re-implement the card deck to use a stack instead of an array. Also add a to_s method which prints all elements in the deck. Finally alter the deal method to return the last n elements, with n having a default value of 1



Now we have our Card and Card Deck classes. Let's start implementing the game.

### Exercise 6

Open the Base Player class, and complete the missing code.

### Exercise 7

Open the Go Fish class, and complete the missing code.



Make sure all your tests are passing. To play the game, open the terminal and run your file from there:

ruby go_fish.rb

