/* 1. Automate a registration form  
    - Implement WebDriverWait or FluentWait (avoid Thread.sleep).*/

package com.auttelfon.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.time.Duration;

public class RegistrationFormTest {

    WebDriver driver;
    WebDriverWait wait;

    @BeforeClass
    public void setUp() {
        // Set path for ChromeDriver
        System.setProperty("webdriver.chrome.driver", "drivers/chromedriver.exe");

        // Initialize ChromeDriver
        driver = new ChromeDriver();
        driver.manage().window().maximize();

        // Initialize WebDriverWait (timeout 10 seconds)
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));

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

        // Wait for the success message to appear
        WebElement successMessage = wait.until(
                ExpectedConditions.visibilityOfElementLocated(By.id("successMessage"))
        );

        // Verify success message
        Assert.assertEquals(successMessage.getText(), "Registration Successful!", "Success message mismatch!");
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
