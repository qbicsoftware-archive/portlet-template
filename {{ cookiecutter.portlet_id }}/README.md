# template_qbicportlet
This repository provides a template for a QBiC Liferay Vaadin Portlet based on Maven.

## How to use the template?

### STEP 1 - Create a new repository on GitHub
Create a new repository on Github. You can find a description of it [here](https://help.github.com/articles/create-a-repo/). 

### STEP 2 - Mirror the template to your new repo
1. Open the terminal and clone the template repo
```git
git clone --bare git@github.com:qbicsoftware/template_qbicportlet.git
```

2. Then mirror-push it to the new repository
```git
cd template_qbicportlet.git
git push --mirror https://github.com/qbicsoftware/my_first_portlet.git
```

3. Remove the just created temporary local repository 
```git
cd ..
rm -rf template_qbicportlet.git 
```

4. Clone new repository
```git
git clone https://github.com/qbicsoftware/my_first_portlet.git
```
##### Note that all the remote branches of the template_portlet repository are cloned as well.

### STEP 3 - Personalize your portlet
To personalize your portlet there are a few files you need to change. Expressions beginning with an '$' need to be replaced by your own definitions:
1. liferay-display.xml
```xml
<category name="Portlets">
  <portlet id="$PORTLET_ID" />
</category>
```

2. liferay-plugin-package.properties
```properties
name=$PORTLET_ID
short-description=$DESCRIPTION
author=$AUTHOR
```

3. liferay-portlet.xml
```xml
<portlet>
  <portlet-name>$PORTLET_ID</portlet-name>
</portlet>
```

4. portlet.xml
```xml
<portlet>
  <description>$DESCRIPTION</description>
  <portlet-name>$PORTLET_ID</portlet-name>
  <display-name>$PORTLET_ID</display-name>
  <!-- Just needs to be changed if you change the path to your main UI class or its name--->
  <init-param>
    <name>UI</name>
    <value>life.qbic.$MAIN_UI</value>
  </init-param>
  <portlet-info>
    <title>$PORTLET_ID</title>
    <short-title>$PORTLET_ID</short-title>
    <keywords>Vaadin 7</keywords>
  </portlet-info>
</portlet>
```

5. web.xml
```xml
<display-name>$PORTLET_ID</display-name>
```

6. pom.xml
```xml
<artifactId>$ARTIFACT_ID</artifactId>
<version>1.0</version>
<name>$PORTLET_ID</name>
```

### Start coding and enjoy your custom vaadin portlet :)
