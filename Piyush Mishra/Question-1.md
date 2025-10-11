/* 1. Automate a registration form  
    - Include fields like username, email, phone, and password.  */
    
package com.auttelfon.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class RegistrationFormTest {

    WebDriver driver;

    @BeforeClass
    public void setUp() {
        // Set path for ChromeDriver
        System.setProperty("webdriver.chrome.driver", "drivers/chromedriver.exe");

        // Initialize ChromeDriver
        driver = new ChromeDriver();
        driver.manage().window().maximize();

        // Open the registration page
        driver.get("file:///C:/path/to/Register.html"); // Replace with your local path or live URL
    }

    @Test
    public void registerUserTest() {
        // Fill form fields
        driver.findElement(By.id("username")).sendKeys("PiyushTestUser");
        driver.findElement(By.id("email")).sendKeys("piyush.test@example.com");
        driver.findElement(By.id("phone")).sendKeys("9876543210");
        driver.findElement(By.id("password")).sendKeys("Tester@123");

        // Submit the form
        driver.findElement(By.id("submit")).click();

        // Verify success message
        String successText = driver.findElement(By.id("successMessage")).getText();
        Assert.assertEquals(successText, "Registration Successful!", "Success message mismatch!");
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
