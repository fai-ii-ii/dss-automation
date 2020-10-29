*** Settings ***
Library    Selenium2Library
Library    DateTime
Resource    ../resources/test_data/test_data.robot

*** Variables ***
${browser}    chrome
${url}    https://undss-dev-unsmin.azurewebsites.net/
${msg_type}    Alert
${Falkland_Islands_DA_id}    69
${msg_title}    This is test message, sent from automation script
${msg_text}    please ignore, sent from automation script

*** Test Cases ***
TC_01
    Close All Browsers
    Open Browser    ${url}    ${browser}
    sleep    3
    Input Text    //input[@id="dnn_ctr671_Login_Login_DNN_txtUsername"]    ${user_name}
    Input Text    //input[@id="dnn_ctr671_Login_Login_DNN_txtPassword"]    ${password}
    Click Element    //a[@id="dnn_ctr671_Login_Login_DNN_cmdLogin"]
    sleep    30
    Click Element    //a[text() = 'ETA']
    sleep    30
    Click Element    //a[text() = 'Message Tool Plus']
    sleep    3
    Click Element    //span[text() = 'Quick Notification']
    sleep    2
    Click Element    //span[text() = '${msg_type}']/../../div[2]/input
    Select From List by Value    //select[@id="DDL_DA"]    ${Falkland_Islands_DA_id}
    Click Element    //input[@id="cbAllEntities"]
    ${date_time} =	Get Current Date
    Input Text    //input[@id="msgTitle"]    ${msg_title} ${date_time}
    Input Text    //textarea[@id="txt_Message"]    ${msg_text} ${date_time}
    Click Element    //input[@id="ButtonSend"]

