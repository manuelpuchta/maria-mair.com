const webpack = require('webpack');
const path = require('path');

const ExtractTextPlugin = require('extract-text-webpack-plugin');
const autoprefixer = require('autoprefixer');
const autoprefixerBrowserslist = 'last 2 versions';
const CleanWebpackPlugin = require('clean-webpack-plugin');

const nodeEnv = process.env.NODE_ENV || 'development';
const isDevelopment = nodeEnv === 'development';
const extractSass = new ExtractTextPlugin({
  filename: '[name].css'
});

const plugins = [
  new webpack.NamedModulesPlugin(),

  // We extract all vendors into a separate file
  new webpack.optimize.CommonsChunkPlugin({
    name: 'vendor',
    minChunks: (module) => {
      // this assumes your vendor imports exist in the node_modules directory
      return module.context && module.context.indexOf('node_modules') !== -1;
    }
  }),

  // We extract the webpack bootstrap logic into a separate file
  new webpack.optimize.CommonsChunkPlugin({
    name: 'manifest'
  }),

  new webpack.DefinePlugin({
    'process.env': {
      NODE_ENV: JSON.stringify(nodeEnv)
    }
  })
];

const rules = [
  {
    test: /\.js$/,
    exclude: /node_modules/,
    loader: 'babel-loader',
    options: {
      cacheDirectory: true // `babel-loader` caching
    }
  }
];

if (isDevelopment) {
  rules.push(
    {
      test: /\.scss$/,
      exclude: /node_modules/,
      use: [{
        loader: "style-loader", // creates style nodes from JS strings
        options: {
          sourceMap: true
        }
      }, {
        loader: "css-loader", // translates CSS into CommonJS
        options: {
          sourceMap: true
        }
      }, {
        loader: "sass-loader", // compiles Sass to CSS
        options: {
          sourceMap: true,
          includePaths: [
            path.resolve(__dirname, 'src'),
          ]
        }
      }]
    }
  );
} else {
  plugins.push(
    new CleanWebpackPlugin('build'),
    new webpack.optimize.UglifyJsPlugin({
      sourceMap: false
    }),
    extractSass
  );

  rules.push(
    {
      test: /\.scss$/,
      use: extractSass.extract({
        use: [{
          loader: 'css-loader'
        }, {
          loader: 'postcss-loader',
          options: {
            plugins: () => {
              return [autoprefixer(autoprefixerBrowserslist)]
            }
          }
        }, {
          loader: 'sass-loader',
          options: {
            outputStyle: 'compressed',
            includePaths: [
              path.resolve(__dirname, 'src'),
            ]
          }
        }]
      })
    }
  );
}

const config = {
  // inlines SourceMap into original file
  devtool: isDevelopment ? 'eval-source-map' : false,
  // Here the application starts executing
  // and webpack starts bundling
  entry: {
    index: ['babel-polyfill', './src/index.js']
  },
  // options related to how webpack emits results
  output: {
    // the filename template for entry chunks
    filename: '[name].js',
    // name of on-demand loaded chunk files
    chunkFilename: '[name].chunk.js',
    // the target directory for all output files
    // must be an absolute path (use the Node.js path module)
    path: isDevelopment ? path.resolve(__dirname, 'html/static/') : path.resolve(__dirname, 'build/static/'),
    // the url to the output directory resolved relative to the HTML page
    publicPath: '/'
  },
  module: {
    // rules for modules (configure loaders, parser options, etc.)
    rules: rules
  },
  resolve: {
    // options for resolving module requests
    // (does not apply to resolving to loaders)
    modules: [path.resolve(__dirname, 'src'), 'node_modules']
  },
  watch: isDevelopment,
  watchOptions: {
    aggregateTimeout: 500,
    ignored: /node_modules/
  },
  // adding plugins to our configuration
  plugins
};

module.exports = config;
