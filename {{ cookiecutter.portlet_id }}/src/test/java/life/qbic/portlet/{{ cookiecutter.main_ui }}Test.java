package life.qbic.portlet;

import org.junit.Test;
import static org.junit.Assert.assertTrue;

public class {{ cookiecutter.main_ui }}Test {

    @Test
    public void mainUIExtendsQBiCPortletUI() {
        assertTrue("The main UI class must extend life.qbic.portlet.QBiCPortlet", 
            QBiCPortletUI.class.isAssignableFrom({{ cookiecutter.main_ui }}.class));
    }

    @Test
    public void mainUIIsNotQBiCPortletUI() {
        assertFalse("The main UI class must be different to life.qbic.portlet.QBiCPortlet", 
            QBiCPortlet.class.equals({{ cookiecutter.main_ui }}.class));
    }
}