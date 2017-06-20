var colors = ["blue", "pink", "yellow", "fire red"];

var names = ["Mike", "Lucky", "Winner", "Cruz"];

colors.push("coral");
names.push("Champion");

console.log(colors)
console.log(names)

var horses = {};

for (var i = 0; i < colors.length; i++) {
  horses[names[i]] = colors[i];
};

console.log(horses);

// RELEASE 2 : Horses are great, but times are a-changin', and we need to add an option for faster transportation that we can create with an assembly line. At the bottom of your data_structures.js file, write a constructor function for a car. Give it a few different properties of various data types, including at least one function. Demonstrate that your function works by creating a few cars with it.

function Car(make, model, color, num_doors) {

  this.make = make;
  this.model = model;
  this.color = color;
  this.num_doors = num_doors;

  this.honks = function() { console.log("beep!"); };

  console.log("CAR INITIALIZATION COMPLETE");
};

var newCar = new Car("BMW", "M5", "red", 4);
console.log(newCar);
console.log("Our car can honk:");
newCar.honks();
console.log("----------")

var anotherCar = new Car("KIA", "Sportage", "gray", 5);
console.log(anotherCar);
console.log("Our second car can honk:");
anotherCar.honks();
console.log("----------")


