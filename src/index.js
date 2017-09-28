'use strict';

import Header from 'header/header';

import './index.scss';

// const dom = document.getElementById('app');

class Index {
  constructor() {
    console.log('hi from Index class.');

    const header = new Header();
  }
}

const app = new Index();
