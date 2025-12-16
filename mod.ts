import { Model } from "https://esm.sh/minizinc@4.4.4/dist/minizinc-node.js"

const model = new Model()

model.addFile("test.mzn", "var 1..3: x;")

const solve = model.solve({
    options: {
        solver: "gecode",
        "all-solutions": true,
    },
})

solve.on("solution", solution => {
    console.log(solution.output.json)
})
