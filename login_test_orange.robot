*** Settings ***
Documentation    Test case for login page orange.com
Library          SeleniumLibrary

*** Variables ***
${URL}           https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}      Admin
${PASSWORD}      admin123
${USERNAME_INVALID}     invalid_user
${PASSWORD_INVALID}     invalid_password

*** Test Cases ***
Đăng nhập thành công
    #1 Mở trình duyệt
    Mở trình duyệt
    #2 Đăng nhập
    Đăng nhập    ${USERNAME}    ${PASSWORD}
    #3 Kiểm tra đăng nhập thành công
    Kiểm tra đăng nhập thành công
    #4 Đóng trình duyệt

Đăng nhập 0 thành công
    #1 Mở trình duyệt
    Mở trình duyệt
    #2 Đăng nhập
    Đăng nhập    ${USERNAME_INVALID}    ${PASSWORD_INVALID}
    #3 Kiểm tra đăng nhập thất bại
    Kiểm tra đăng nhập thất bại
    #4 Đóng trình duyệt


*** Keywords ***
Mở trình duyệt
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    5s
Đăng nhập
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input     ${USERNAME}
    Input Text    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input     ${PASSWORD}
    Click Button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Sleep    5s

Kiểm tra đăng nhập thành công
    Page Should Contain     Time at Work
Kiểm tra đăng nhập thất bại
    Page Should Contain     Invalid credentials
    