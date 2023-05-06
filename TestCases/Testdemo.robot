*** Settings ***

Library  SeleniumLibrary
Documentation    To validate login for,
##Test Teardown    Close Browser


*** Variables ***
${browser}   chrome

${url}  https://demo.nopcommerce.com/
${Error_message_login}  css:.alert-danger

*** Test Cases ***
Validate Succesful login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct


*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=C:/Users/Creayus/AppData/Local/Programs/Python/Python311/Scripts/chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text    id:username   rahulshettyacademy
    Input Password    id:password   12345678
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_message_login}

verify error message is correct
    ${result}=  Get Text    ${Error_message_login}
    Should Be Equal As Strings    ${result}  Incorrect username/password.
    Element Text Should Be    ${Error_message_login}    Incorrect username/password.