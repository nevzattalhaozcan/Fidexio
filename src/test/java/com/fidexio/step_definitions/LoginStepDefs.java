package com.fidexio.step_definitions;

import com.fidexio.pages.LoginPage;
import com.fidexio.utils.BrowserUtils;
import com.fidexio.utils.ConfigurationReader;
import com.fidexio.utils.Driver;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.Keys;

import java.io.IOException;

public class LoginStepDefs {

    LoginPage loginPage = new LoginPage();

    @Given("User is on the login page")
    public void userIsOnTheLoginPage() {
        Driver.getDriver().get(ConfigurationReader.getProperty("environment"));
    }

    @And("User clicks login button")
    public void userClicksLoginButton() {
        loginPage.loginBtn.click();
    }

    @Then("User should be on the homepage")
    public void userShouldBeOnTheHomepage() {
        BrowserUtils.waitForTitle("#Inbox - Odoo");
        BrowserUtils.titleAssertion("#Inbox - Odoo");
    }

    @Then("User should see the error message")
    public void userShouldSeeTheErrorMessage() {
        Assert.assertTrue(loginPage.wrongLoginError.isDisplayed());
    }

    @Then("User should see the required message")
    public void userShouldSeeTheRequiredMessage() {

        if (loginPage.email.getAttribute("required").equals("required")) {
            Assert.assertEquals(loginPage.email.getAttribute("validationMessage"), "Please fill out this field.");
        }

        if (loginPage.password.getAttribute("required").equals("required")) {
            Assert.assertEquals(loginPage.password.getAttribute("validationMessage"), "Please fill out this field.");
        }

    }

    @When("User enters an email {string}")
    public void userEntersAnEmail(String arg0) throws IOException {
        loginPage.email.sendKeys(arg0);
    }

    @And("User enters a password {string}")
    public void userEntersAPassword(String arg0) {
        loginPage.password.sendKeys(arg0);
    }

    @When("User clicks reset password link")
    public void userClicksResetPasswordLink() {
        loginPage.resetPassword.click();
    }

    @Then("User lands on the reset password page")
    public void userLandsOnTheResetPasswordPage() {
        Assert.assertTrue(Driver.getDriver().getTitle().contains("Reset password"));
    }

    @Then("User sees the password in bullet sign")
    public void userSeesThePasswordInBulletSign() {
        String type = loginPage.password.getAttribute("type");
        Assert.assertEquals(type, "password");
    }

    @And("User presses enter key")
    public void userPressesEnterKey() {
        loginPage.password.sendKeys(Keys.ENTER);
    }
}