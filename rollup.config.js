import remove from "rollup-plugin-delete";
import {terser} from "rollup-plugin-terser";
import typescript from "@rollup/plugin-typescript";

export default {
    external: [
        "react",
        "react-router-dom"
    ],
    input: "src/ReactRouter.tsx",
    plugins: [
        remove({targets: "lib/*"}),
        typescript(),
        terser()
    ],
    output: {
        file: "lib/ReactRouter.js",
        format: "cjs",
        exports: "default"
    }
};
