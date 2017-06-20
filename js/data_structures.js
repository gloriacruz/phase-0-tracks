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