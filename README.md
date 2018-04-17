# template_qbicportlet
This repository provides a [cookiecutter template][cookiecutter] for a basic QBiC Liferay Vaadin Portlet based on Maven.

Whenever you start a new portlet in QBiC, you can use this template to generate a folder containing all of the needed files for portlet development.

## Requirements
You will need the following tools:

  * [Cookiecutter][cookiecutter].
  * A Java 1.8 compatible SDK.
  * [Apache Maven](https://maven.apache.org/).

Other than that, you will also need writing access to the [QBiC Software GitHub organization](https://github.com/qbicsoftware).

## How to use this template?

### STEP 1 - Generating a basic QBiC Portlet.
Open a terminal and execute the following command:

```sh
$ cookiecutter https://github.com/qbicsoftware/template_qbicportlet
```

You will first notice that you are prompted to enter some values, as seen here:

```sh
author [Winnie the Pooh]: Homer Simpson
portlet_id [helloworld-portlet]: donut-portlet
display_name [HelloWorld Portlet!]: Donut Portlet
version [0.0.1-SNAPSHOT]: 
short_description [Simple portlet]: Mmm donuts
main_ui [QBiCPortletUI]: DonutPortletUI
```

The values shown between brackets are the defaults. To use the default value (as Homer did here for `version`), simply press `ENTER` without entering any other text. Default values are provided in the `cookiecutter.json` file.

Without getting too much into details, cookiecutter will generate a folder which you can immediately use for portlet development. References to cookiecutter variables (e.g., ``{{ cookiecutter.version }}`` will be properly substituted. The name of the generated folder is determined by the value of the ``{{ cookiecutter.portlet_id }}`` variable (i.e., ``donut-portlet`` in our example). This will be generated on the same folder on which you executed the ``cookiecutter`` command. 

You should see a folder structure similar to:

```
donut-portlet/
├── CODE_OF_CONDUCT.md
├── .gitignore
├── LICENSE
├── pom.xml
├── README.md
└── src
    └── main
        ├── java
        │   └── life
        │       └── qbic
        │           └── DonutPortletUI.java
        ├── resources
        │   ├── life
        │   │   └── qbic
        │   │       └── AppWidgetSet.gwt.xml
        │   └── portlet.properties
        └── webapp
            ├── VAADIN
            │   └── themes
            │       └── mytheme
            │           ├── addons.scss
            │           ├── mytheme.scss
            │           ├── styles.css
            │           └── styles.scss
            └── WEB-INF
                ├── liferay-display.xml
                ├── liferay-plugin-package.properties
                ├── liferay-portlet.xml
                ├── portlet.xml
                └── web.xml
```

### STEP 2 - Test your portlet.
Go to the generated folder (i.e., `donut-portlet` in our case) and execute the following _maven_ command in a terminal (or using your IDE of choice), like so:

```sh
$ mvn jetty:run
```
You should see an output similar to:

```sh
[INFO] Started ServerConnector@67c06a9e{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
[INFO] Started @30116ms
[INFO] Started Jetty Server
```

Direct your browser to http://localhost:8080. You should see a button, and after clicking it, it should display some information about your portlet. So far so good, congratulations!

### STEP 3 - Create a new repository for your new portlet.
At this point you have a simple QBiC portlet with all the required dependencies, you need to create a remote repository for it, so it's available for everyone. Follow [this guide](https://help.github.com/articles/create-a-repo/) to create a remote repository on GitHub. For this example, we will still use `donut-portlet` as the name of our repository.

Once your remote repository has been created, make sure you are in the generated folder (i.e., `donut-portlet`) and execute the following commands:

```sh
$ git init
$ git add .
$ git commit -m "Initial commit after template configuration"
$ git remote add origin https://github.com/qbicsoftware/donut-portlet
$ git push origin master
``` 

You can start using your repository containing your brand new portlet.


[cookiecutter]: https://cookiecutter.readthedocs.io
