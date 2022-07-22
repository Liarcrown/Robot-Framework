*** Settings ***
Documentation     Robot Framework Example
Library           Selenium2Library

Suite Setup    Open Browser    https://news.tvbs.com.tw/    firefox    executable_path=./geckodriver
Suite Teardown    Close Browser

*** Variables ***
${articleName1} =    童年
${articleName2} =    世運

*** Test Cases ***
My Test
    [Template]    Search Article Template
    ${articleName1}
    ${articleName2}


*** Keywords ***
Click Search Button
    [Documentation]    Click search button in ithelp home page
    Wait Until Element Is Visible    xpath=/html/body/div/header/div/div[2]/div/div[2]/div[2]/form/div
    Click Element    xpath=/html/body/div/header/div/div[2]/div/div[2]/div[2]/form/div

Click Submit Button
    [Documentation]    Click search submit button in search area
    Wait Until Element Is Visible    xpath=/html/body/div/header/div/div[2]/div/div[2]/div[2]/form/div/div
    Click Element    xpath=/html/body/div/header/div/div[2]/div/div[2]/div[2]/form/div/div
   
Input Search Content
    [Documentation]    Input search content in search bar
    [Arguments]    ${article}
    Wait Until Element Is Visible    xpath=/html/body/div/header/div/div[2]/div/div[2]/div[2]/form/div/input
    Input Text    xpath=/html/body/div/header/div/div[2]/div/div[2]/div[2]/form/div/input    ${article}

Search Article Template
    [Documentation]    Tempalte for search ithelp aritcle need give aritcle variable
    [Arguments]    ${article}
    Click Search Button
    Input Search Content    ${article}
    Click Submit Button
    Verify Article Is Existing    ${article}

Verify Article Is Existing
    [Documentation]    Verify search article is existing
    [Arguments]    ${article}
    Wait Until Page Contains Element    xpath=/html/body/div/main/div/article/div[2]/div[2]/ul/li[1]/a/h2
    ${getArticle} =    Get Text    xpath=/html/body/div/main/div/article/div[2]/div[2]/ul/li[1]/a/h2
    Should Contain    ${getArticle}    ${article}
