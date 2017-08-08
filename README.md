# maria-mair.com

> Website development of [Maria Mair](https://maria-mair.com/)

This project relies just on awesome Craft cms.

## Getting Started

### Download / Clone

Clone the repo using Git:

```bash
git clone git@github.com:manuelpuchta/maria-mair.com.git
```

### Quick project overview

* Development environment: [Vagrant](http://www.vagrantup.com)

  * [Craft cms](https://craftcms.com/)

    * SCSS: [BEM](http://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/) - meaning block, element, modifier - `src/**/*.{scss}`

    * JS: pure Vanilla JS (ES6) - via [Babel](https://babeljs.io/) JavaScript compiler  - `src/**/*.{js}`

### Dependencies

Before you start with the development, you will need to install the following dependencies on your system:

- [Vagrant](http://www.vagrantup.com/downloads.html) (tested with 1.7.2)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) (tested with 4.3.28)
- [Vagrant Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) (tested with 0.0.11)
- [Vagrant triggers](https://github.com/emyl/vagrant-triggers) (tested with 0.5.2)
- [Node JS](http://nodejs.org)

```bash
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-triggers
npm install
```

### Development server

Run the following command in your project directory:

```bash
vagrant up
```

Open your browser and visit [http://development.maria-mair.com/](http://development.maria-mair.com/).

#### What's installed

+ Ubuntu Trusty (14.04)
+ Apache
+ php
+ MySQL
+ Git
+ Craft cms (latest.tar.gz)

#### Working with the local environment

Vagrant:

```bash
# suspend the VM:
vagrant suspend
# you can resume a vagrant managed machine after suspend via:
vagrant up
# destroy / shut down the VM:
vagrant destroy
```

Craft cms login:

`http://development.maria-mair.com/admin/` the username is `janedoe`, the password is `vagrant`.

#### Nice to know

* If you're needing a password (for anything - including mysql, it should be `vagrant`)
* get a fresh craftcms database dump into project root directory (ssh into server `vagrant ssh`, change into linked vagrant directory `cd /vagrant`): execute `mysqldump -u root -pvagrant craftcms > craftcms-dump.sql`
* Craft cms init with: `user: janedoe`, `email: janedoe@localhost.wtf` and `password: vagrant`.

### Frontend setup

Install all npm dependencies:

To get started with local development, run:

```bash
npm install
```
once.

Start webpack compiler:

```bash
npm start
```

To build a production ready version, run:

```bash
npm run release
```

This will clean the `dist` folder and compile a fresh production ready version into `dist`.
