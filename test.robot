*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_btn}    dt_login_button
${email_field}  txtEmail
${pw_field}     txtPass

*** Test Cases ***
Open Deriv
    Login   ${my_email}     ${my_password}
    Enter API page
    Create single scope api token
    insert valid api token name
    delete api token


*** Keywords ***
Login
    [arguments]  ${email}  ${password}
    Open Browser    https://app.deriv.com      chrome
    set window size      1280    1080
    wait until page contains element    ${login_btn}       60
    Click Element    ${login_btn}

    wait until page contains element    ${email_field}      15
    input text      ${email_field}    ${email}      True
    input text      ${pw_field}     ${password}      True
    click element       //*[text()="Log in"]

Enter API page
    wait until page does not contain element     dt_core_header_acc-info-preloader      30
    click element   //a[@class="account-settings-toggle"]
    wait until page contains element    dc_api-token_link       15
    click element   dc_api-token_link
    wait until page does not contain element        //*[@class="initial-loader account__initial-loader"]
    checkbox should not be selected     //*[@name="read"]
    checkbox should not be selected     //*[@name="trade"]
    checkbox should not be selected     //*[@name="payments"]
    checkbox should not be selected     //*[@name="admin"]
    checkbox should not be selected     //*[@name="trading_information"]
    element should be disabled      //*[@class="da-api-token__input-group"]//button[contains(@class, "")]

Create single scope api token
    click element       //*[@class="dc-checkbox"]//*[text()="Read"]
    checkbox should be selected     //*[@name="read"]

insert valid api token name
    input text      //*[@name="token_name"]     test_from_robot_1
    element should be enabled       //*[@class="da-api-token__input-group"]//button[contains(@class, "")]
    click element       //*[@class="da-api-token__input-group"]//button[contains(@class, "")]
    wait until page does not contain element    //*[@class="initial-loader initial-loader--btn"]
    table row should contain    //table[@class="da-api-token__table"]       1       test_from_robot_1
    table row should contain    //table[@class="da-api-token__table"]       1       Read

delete api token
    click element   //button[.//span='Delete']
    click element   //button[.//span='Yes']
    wait until page does not contain element    //table//tbody/tr
    page should not contain element    //table//tbody/tr


