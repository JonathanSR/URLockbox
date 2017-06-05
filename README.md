# URLockBox

The URLockbox is a rails application, that allows you to store and save multiple URL links. It allows you to store one URL at a time with a title and it gives you the ability to see all your saved URL's with options to filter and display only certain links. This is a perfect replacement for your default bookmark from your prefered browser. You can use the live site at https://young-retreat-72886.herokuapp.com/login .


### Installing / Getting Started

```shell
git clone git@github.com:JonathanSR/URLockbox.git #clones this application to your machine.
cd URLlockbox/ #gives you access to the root folder.
bundle #install all dependencies needed to run the application
rake db:create #creates the databases.
rake db:migrate #runs all migrations that make changes to the databases.
```

You will need to download version 46 of Firefox [here](https://www.softexia.com/windows/web-browsers/firefox-46). If you do have it, make sure it is on version 46. Selenium does not work with all versions of Firefox, so make sure that you are using Firefox 46 or else it will potentially cause you problems.

If you already have Firefox and it's on a version more recent than 46, the easiest way to downgrade is to uninstall Firefox then install version 46.

## Usage

To run the test suite:
```shell
rspec
```
To run the server(runs on port 3000):
```shell
rails s
```

To access the database:
```shell
rails c
```

