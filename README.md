# template_qbicportlet
This repository provides a [cookiecutter template][cookiecutter] for a basic QBiC Liferay Vaadin Portlet based on Maven.

## How to use this template?

### STEP 1 - Getting cookiecutter.
The generation of project files is done with the help of [cookiecutter templates][cookiecutter], so you need to download it and be sure it works on your system.

### STEP 2 - Generating a basic QBiC Portlet.
Execute the following command:

```sh
cookiecutter https://github.com/qbicsoftware/template_qbicportlet
```

You will first see that cookiecutter wants you to provide values directly on the terminal, as seen here:

```sh
author [Winnie the Pooh]: Homer Simpson
portlet_id [helloworld-portlet]: donut-portlet
display_name [HelloWorld Portlet!]: Donut Portlet
version [0.0.1-SNAPSHOT]: 
short_description [Simple portlet]: Mmm donuts
main_ui [QBiCPortletUI]: DonutPortletUI
```

The values shown between brackets are the defaults. To use the default value (as Homer did here for `version`), simply press `ENTER` without entering any other text. Default values are provided in `cookiecutter.json`.

This will first clone the `template_qbicportlet` github repository into your "cloned cookiecutters" directory (`<home-folder>/.cookiecutters` by default). You can configure your "cloned cookiecutters" directory by following [this guide][cookiecutter_advanced_config].

After the repository has been cloned, cookiecutter will generate a directory containing all of the files needed to implement a basic QBiC portlet. The name of the generated folder is determined by the ``{{ cookiecutter.portlet_id }}`` variable. This will be generated on the same folder on which you executed the ``cookiecutter`` command.

Without getting too much into details, cookiecutter will scan the cloned repository and search for references to cookiecutter variables (e.g., ``{{ cookiecutter.author }}``). Each variable reference will be substituted by the provided value. What's neat about cookiecutter is that this substitution works not only at the file content level, but you can also use cookiecutter variables to name whole files or directories. 

### STEP 3 - Test your portlet.
Change to the generated folder (i.e., `donut-portlet` in our case) and execute the following _maven_ command in a terminal (or using your IDE of choice), like so:

```sh
cd donut-portlet
mvn jetty:run
```
Then, direct your browser to http://localhost:8080. You should see a button, and after clicking it, it should display some information about your portlet. So far so good, congratulations!

### STEP 4 - Create a new repository for your new portlet.
At this point you have a simple QBiC portlet with all the required dependencies, we will now create a remote repository for it, so it's available for everyone. Follow [this guide](https://help.github.com/articles/create-a-repo/) to create a remote repository on GitHub. For this example, we will still use `donut-portlet` as the name of our repository.

Once your remote repository has been created, make sure you are in the generated folder (i.e., `donut-portlet`) and execute the following commands:

```sh
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/qbicsoftware/donut-portlet
git push origin master
``` 

You can start coding now. Enjoy your custom vaadin portlet :)


[cookiecutter]: https://cookiecutter.readthedocs.io
[cookiecutter_advanced_config]: https://cookiecutter.readthedocs.io/en/latest/advanced/user_config.html