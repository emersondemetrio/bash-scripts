const percent = process.argv[2];
const total = process.argv[3];
const mode = process.argv[4];

const allowedModes = ["p", "t"];

const exitWithHelp = (help, extra = "") => {
  console.log(help, extra);
  process.exit();
};

if (mode && !allowedModes.includes(mode)) {
  exitWithHelp("Please provide a valid mode", allowedModes);
}

if (!total || !percent || isNaN(total) || isNaN(percent)) {
  exitWithHelp("Please provide a total and a percent");
}

const modes = {
  p: (y, N) => `Q: How much is ${y}% of a total of ${N}?`,
  t: (y, N) => `Q: Given that x is ${y}% of ${N}, how much is x?`,
};

console.log(modes[mode || "p"](percent, total), "\n");

if (!mode || mode === "p") {
  const result = (percent / total) * 100;
  console.log(`> ${percent} is ${result}% of ${total}`);
}

if (mode === "t") {
  const result = (percent / 100) * total;
  console.log(`> ${percent}% of ${total} is = ${result}`);
  console.log(`> ${total} - ${result} = ${total - result}`);
  console.log(`> x = ${total - result}`);
}
