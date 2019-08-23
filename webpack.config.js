const HtmlWebpackPlugin = require("html-webpack-plugin");
const path = require("path");

module.exports = {
  mode: "development",
  context: __dirname,
  entry: path.resolve(__dirname, "src", "index.ts"),
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: 'bundle.js',
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js"],
  },
  module: {
    rules: [
      {
        test: /\.ts$/i,
        loader: "ts-loader",
        exclude: /node_modules/
      },
      {
        test: /\.wasm$/i,
        loader: "raw-loader",
        exclude: /node_modules/
      }
    ],
  },
  watch: true,
  watchOptions: {
    ignored: ['build', 'node_modules']
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: "AS Contract",
      template: 'src/index.html'
    })
  ],
}