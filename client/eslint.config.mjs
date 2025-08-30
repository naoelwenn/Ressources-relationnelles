import js from "@eslint/js";
import globals from "globals";
import react from "eslint-plugin-react";
import { defineConfig } from "eslint/config";

export default defineConfig([
  // Config de base JavaScript
  js.configs.recommended,

  // Config React
  {
    files: ["**/*.{js,mjs,cjs,jsx}"],
    plugins: {
      react,
    },
    rules: {
      "react/react-in-jsx-scope": "off", // ⬅ plus nécessaire avec React 17+
    },
    settings: {
      react: {
        version: "detect", // auto-détection (React 18)
      },
    },
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
  },

  // Recommandations React
  react.configs.flat.recommended,
]);
