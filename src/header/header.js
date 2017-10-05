'use strict';

import './header.scss';

const dom = document.getElementById('app');

class Header {
  constructor() {
    this.headerToggleClass = 'header__content--max-height';
    this.headerToggleText = ['Mehr.', 'Weniger.'];
    this.headerIsVisible = false;
    this.headerContentElement = document.getElementsByClassName('header__content')[0];
    this.headerToggleElement = document.getElementsByClassName('header__toggle')[0];
    const toggleHandler = (e) => this.toggleHandler(e);
    this.headerToggleElement.addEventListener('touchstart', toggleHandler);
    this.headerToggleElement.addEventListener('mousedown', toggleHandler);
  }

  toggleHandler(e) {
    e.preventDefault();
    let el = this.headerContentElement,
    className = this.headerToggleClass;

    if (el.classList) {
      el.classList.toggle(className);
    } else {
      let classes = el.className.split(' ');
      let existingIndex = classes.indexOf(className);

      if (existingIndex >= 0)
        classes.splice(existingIndex, 1);
      else
        classes.push(className);

      el.className = classes.join(' ');
    }
    this.headerToggleElement.innerHTML = this.headerIsVisible ? this.headerToggleText[0] : this.headerToggleText[1];
    this.headerIsVisible = !this.headerIsVisible;
  }
}

export default Header;
