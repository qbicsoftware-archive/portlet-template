# template_qbicportlet

[![Build Status](https://travis-ci.org/qbicsoftware/template_qbicportlet.svg?branch=master)](https://travis-ci.org/qbicsoftware/template_qbicportlet)[![Code Coverage]( https://codecov.io/gh/qbicsoftware/template_qbicportlet/branch/master/graph/badge.svg)](https://codecov.io/gh/qbicsoftware/template_qbicportlet)

There is a lot of boilerplate code associated to building Vaadin portlets, so it makes sense to automate their creation. This repository provides a [cookiecutter template][cookiecutter] for a basic QBiC Liferay Vaadin Portlet based on Maven. Whenever you start a new Vaadin portlet in QBiC, you can use this template to generate a folder containing all of the needed files for development.

## Requirements

You will need the following:

* Python, version 2.7 or more recent.
* [Cookiecutter][cookiecutter], version 1.5 or more recent.
* A Java 1.8 compatible SDK.
* [Apache Maven](https://maven.apache.org/).
* [Travis CI Client][travis-console].
* Access to the [QBiC Software GitHub organization](https://github.com/qbicsoftware) so you can create your own GitHub repository.

## Usage

### I - Generating a basic QBiC Portlet

Execute the following command on your terminal:

```bash
cookiecutter https://github.com/qbicsoftware/template_qbicportlet
```

You will first notice that you are prompted to enter some values, as seen here:

```bash
author [Winnie the Pooh]: Homer Simpson
email [pooh@qbic.uni-tuebingen.de]: simpson@burns.com
portlet_id [helloworld-portlet]: donut-portlet
display_name [HelloWorld Portlet]: Donut Portlet
version [0.0.1-SNAPSHOT]:
short_description [Simple portlet]: Mmm donuts
main_ui [QBiCPortletUI]: DonutPortletUI
copyright_holder [QBiC]: Mr. Burns
```

The values shown between brackets are the defaults. To use the default value (as Homer did here for `version`), simply press `ENTER` without entering any other text. Default values are provided in the `cookiecutter.json` file. In any case, **make sure to consult our naming and versioning conventions guide**.

Cookiecutter will generate a folder which you can use for portlet development. References to cookiecutter variables (e.g., ``{{ cookiecutter.version }}``) will be properly substituted. The name of the generated folder is determined by the value of the ``{{ cookiecutter.portlet_id }}`` variable (i.e., ``donut-portlet`` in our example). This will be generated on the same folder on which you executed the ``cookiecutter`` command:

```bash
donut-portlet/
├── .gitignore
├── .travis.yml
├── CODE_OF_CONDUCT.md
├── LICENSE
├── pom.xml
├── README.md
└── src
    ├── main
    │   ├── java
    │   │   └── life
    │   │       └── qbic
    │   │           ├── portlet
    │   │           │   ├── DonutPortletUI.java
    │   │           │   └── QBiCPortletUI.java
    │   │           └── servlet
    │   ├── resources
    │   │   ├── life
    │   │   │   └── qbic
    │   │   │       └── portlet
    │   │   │           └── AppWidgetSet.gwt.xml
    │   │   └── portlet.properties
    │   └── webapp
    │       ├── VAADIN
    │       │   └── themes
    │       │       └── mytheme
    │       │           ├── addons.scss
    │       │           ├── mytheme.scss
    │       │           ├── styles.css
    │       │           └── styles.scss
    │       └── WEB-INF
    │           ├── liferay-display.xml
    │           ├── liferay-plugin-package.properties
    │           ├── liferay-portlet.xml
    │           ├── portlet.xml
    │           └── web.xml
    └── test
        └── java
            └── life
                └── qbic
                    └── portlet
                        └── DonutPortletUITest.java

```

### II - Write jUnit tests, check code coverage

The generated folder already contains a simple [jUnit](junit) test (i.e., in `src/test/java/life/qbic/portlet/DonutPortletUITest.java`). Writing code that tests your code is an important part of the development lifecycle. The idea is to be able to catch bugs before they are released. If at least one unit test fails after changing the code, it means that either the requirements changed (and you haven't updated the test) or your code is broken (and you have to fix it). This happens before your code is released, so you are improving the quality of the code you are delivering.

As a general guideline, try to code the _logic_ of your portlet independent of the user interface so you can easily write code that tests your portlet.

Write your tests on the `src/test/java/life/qbic/` folder. To locally run the unit tests and generate a code coverage report, use the following maven command:

```bash
mvn cobertura:cobertura
```

### III - Test your portlet locally

Go to the generated folder (i.e., `donut-portlet` in our case) and run:

```bash
mvn jetty:run
```

You should see an output similar to:

```bash
[INFO] Started ServerConnector@67c06a9e{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
[INFO] Started @30116ms
[INFO] Started Jetty Server
```

Direct your browser to [localhost:8080](http://localhost:8080). If everything went fine, you will see a button, and after clicking it, it should display some information about your portlet. So far so good, congratulations!

### IV - Create a new GitHub repository for your new portlet

You now have a simple QBiC portlet with all the required dependencies. You still need to create a remote repository for it, though, so it's available for everyone. Follow [this guide](https://help.github.com/articles/create-a-repo/) to create a repository on GitHub. For this example, we will still use `donut-portlet` as the name of our repository. You need to create your GitHub repository under the [QBiC's GitHub organization](https://github.com/qbicsoftware).

Navigate to your new repository's website (i.e., [github.com/qbicsoftware/donut-portlet](https://github.com/qbicsoftware/donut-portlet)) and click on _Settings_. On the left side, click on _Integrations & Services_ and add the _Travis CI_ service. Leave all fields as they are and click on the _Add Service_ button.

### V - Enable your GitHub repository on Travis CI

The generated `donut-portlet` folder contains a `.travis.yml` file that will help you integrate your GitHub repository with [Travis CI][travis], our continuous integration service. Broadly speaking, everytime you _push_ a change into your GitHub repository, [Travis CI][travis] will download the code from your repository, compile it, run the unit tests andd generate a code coverage report. Follow [this guide](https://docs.travis-ci.com/user/getting-started/#To-get-started-with-Travis-CI) to enable your new GitHub repository in Travis CI.

### VI - Deploying your project as a Maven artifact

Even though our Maven repository is visible to everyone publicly, it is password-protected. You will need to modify your `.travis.yml` file to add the encrypted username and password of our Maven repository. In your local GitHub repository directory (i.e., `donut-portlet`) run:

```bash
travis encrypt "MAVEN_REPO_USERNAME=<username>" --add env.global
travis encrypt "MAVEN_REPO_PASSWORD=<password>" --add env.global
```

Ask the people who wrote this guide about the proper values of `<username>` and `<password>`. Encryption and decryption keys in Travis CI are bound to their GitHub repository, so you cannot simply copy them from other places.

### VII - Pushing your first version

In your local GitHub repository directory (i.e., `donut-portlet`) run the following commands:

```bash
git init
git add .
git commit -m "Initial commit after template configuration"
git remote add origin https://github.com/qbicsoftware/donut-portlet
git push origin master
```

Of course, you must replace `donut-portlet` with the real name of your repository. You can now start using your repository containing your brand new portlet.

### VIII - Getting slack notifications from Travis CI (optional)

You can edit the `.travis.yml` file to tell Travis to send slack notifications. In your GitHub local repository folder execute:

```bash
travis encrypt "<your GitHub Account>:<token>" --add notifications.slack.rooms
```

Where `<token>` can be obtained by clicking on the "Edit configuration" icon (it looks like a pencil) [in this page](https://qbictalk.slack.com/apps/A0F81FP4N-travis-ci).

[cookiecutter]: https://cookiecutter.readthedocs.io
[junit]: https://junit.org
[travis]: https://travis-ci.org/
[travis-qbic]: https://travis-ci.org/profile/qbicsoftware
[travis-console]: https://github.com/travis-ci/travis.rb
