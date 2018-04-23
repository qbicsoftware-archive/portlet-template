# template_qbicportlet

![Build status](https://travis-ci.org/qbicsoftware/template_qbicportlet.svg?branch=master)

This repository provides a [cookiecutter template][cookiecutter] for a basic QBiC Liferay Vaadin Portlet based on Maven.

Whenever you start a new portlet in QBiC, you can use this template to generate a folder containing all of the needed files for portlet development.

## Requirements

You will need the following tools:

* [Cookiecutter][cookiecutter], version 1.5 or more recent.
* A Java 1.8 compatible SDK.
* [Apache Maven](https://maven.apache.org/).

Other than that, you will also need writing access to the [QBiC Software GitHub organization](https://github.com/qbicsoftware).

## How to use this template

### I - Generating a basic QBiC Portlet

Open a terminal and execute the following command:

```sh
cookiecutter https://github.com/qbicsoftware/template_qbicportlet
```

You will first notice that you are prompted to enter some values, as seen here:

```sh
author [Winnie the Pooh]: Homer Simpson
email [pooh@qbic.uni-tuebingen.de]: simpson@burns.com
portlet_id [helloworld-portlet]: donut-portlet
display_name [HelloWorld Portlet]: Donut Portlet
version [0.0.1-SNAPSHOT]:
short_description [Simple portlet]: Mmm donuts
main_ui [QBiCPortletUI]: DonutPortletUI
copyright_holder [QBiC]: Mr. Burns
```

The values shown between brackets are the defaults. To use the default value (as Homer did here for `version`), simply press `ENTER` without entering any other text. Default values are provided in the `cookiecutter.json` file.

Without getting too much into details, cookiecutter will generate a folder which you can immediately use for portlet development. References to cookiecutter variables (e.g., ``{{ cookiecutter.version }}``) will be properly substituted. The name of the generated folder is determined by the value of the ``{{ cookiecutter.portlet_id }}`` variable (i.e., ``donut-portlet`` in our example). This will be generated on the same folder on which you executed the ``cookiecutter`` command.

Cookiecutter will create a folder folder with the following structure and contents:

```sh
donut-portlet/
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
    │   │   │       └── AppWidgetSet.gwt.xml
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

### II - Write jUnit tests

The generated folder already contains a simple jUnit test (i.e., in `src/test/java/life/qbic/portlet/DonutPortletUITest.java`). Writing code that tests your code is an important part of the development lifecycle. The idea is to be able to catch bugs before they are released. If at least one unit test fails after changing the code, it means that either the requirements changed (and you haven't updated the test) or your code is broken (and you have to fix it). This happens before your code is released, so you are improving the quality of the code you are delivering.

As a general guideline, try to code the _logic_ of your portlet independent of the user interface so you can easily write code that tests your portlet.

Write your tests on the `src/test/java/life/qbic/` folder. To locally run the unit tests, use the following maven command:

```sh
mvn test
```

### III - Deploy your portlet locally

Go to the generated folder (i.e., `donut-portlet` in our case) and execute the following _maven_ command in a terminal (or using your IDE of choice), like so:

```sh
mvn jetty:run
```

You should see an output similar to:

```sh
[INFO] Started ServerConnector@67c06a9e{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
[INFO] Started @30116ms
[INFO] Started Jetty Server
```

Direct your browser to [localhost:8080](http://localhost:8080). If everything went fine, you will see a button, and after clicking it, it should display some information about your portlet. So far so good, congratulations!

### IV - Create a new repository for your new portlet

At this point you have a simple QBiC portlet with all the required dependencies. You now need to create a remote repository for it, so it's available for everyone. Follow [this guide](https://help.github.com/articles/create-a-repo/) to create a remote repository on GitHub. For this example, we will still use `donut-portlet` as the name of our repository.

Still on the GitHub website, go to your repository (i.e., [github.com/qbicsoftware/donut-portlet][https://github.com/qbicsoftware/donut-portlet]) and click on _Settings_. On the left side, click on _Integrations & Services_ and add the _Travis CI_ service. Leave all fields as they are and click on the _Add Service_ button.

### V - Enable builds on Travis CI

You already integrated your GitHub repository with Travis CI, but you still need to activate your project in Travis CI. Navigate to [QBiC's Travis CI website][travis-qbic] and log-in. Look for your repository by name in the _Filter repositories_ field. If you don't find it, you might need to synchronize your Travis CI account (look for the _Sync account_ button on the upper-right side). Activate your repository by "flicking" the repository switch on.

### VI - Pushing your first version

Once your remote repository has been created, you have added the _Travis CI_ service and enabled your repository in [QBiC's Travis CI website][travis-qbic], go back to your terminal window and make sure you are in the generated folder (i.e., `donut-portlet`). Execute the following commands:

```sh
git init
git add .
git commit -m "Initial commit after template configuration"
git remote add origin https://github.com/qbicsoftware/donut-portlet
git push origin master
```

You can now start using your repository containing your brand new portlet.

### VII - Getting notifications from Travis CI (optional)

The generated `donut-portlet` folder contains a `.travis.yml` file that will help you integrate your GitHub repository with [Travis CI][travis], our continuous integration service. Broadly speaking, everytime you _push_ a change into your GitHub repository, [Travis CI][travis] will download the code from your repository, will compile it and test it (i.e., it will run your unit tests). If everything goes fine, [Travis CI][travis] will also deploy your portlet as a library in our public maven repository and on our test servers.

This has been done for you. You can configure the `.travis.yml` file so 

[cookiecutter]: https://cookiecutter.readthedocs.io
[travis]: https://travis-ci.org/
[travis-qbic]: https://travis-ci.org/profile/qbicsoftware
