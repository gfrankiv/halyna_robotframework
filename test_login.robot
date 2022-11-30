*** Settings ***
Library  SeleniumLibrary
Documentation   Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     //*[text()='Sign in']
${LOGINFIELD}       //*[@id='login']
${PASSWORDFIELD}    //*[@id='password']
${TITLEOFBOX}       //*[@id = '__next']/form/div/div[1]/h5
${SIGNOUTBUTTON}    //span[text()='Sign out']/../*[@class="MuiTypography-root MuiListItemText-primary MuiTypography-body1 MuiTypography-displayBlock"]
${PLAYERSBUTTON}    //*[text() = 'Players']
${SEARCHFIELD}      //*[@aria-label="search"]/../*[@value]
${ADDPLAYERBUTTON}  //*[text()='Add player']
${NAMEFIELD}        //*[@name = 'name']
${SURNAMEFIELD}     //*[@name='surname']
${AGEFIELD}         //*[@type='date']
${MAINPOSITION}     //*[@name= 'mainPosition']
${SUBMITBUTTON}     //*[text()='Submit']
${INVALIDNAMEFIELD}  //*[@name = 'name']

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Sleep   3
    [Teardown]    Close Browser

Check sign out
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Dashboard
    Sleep    5
    Click On The Sign Out Button
    [Teardown]    Close Browser

Check search player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Dashboard
    Sleep    5
    Click On The Players Button
    Sleep   5
    Type in search search name
    Sleep   3
    Click On The Sign Out Button
    Sleep   3
    [Teardown]    Close Browser

Check players button
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Dashboard
    Sleep    5
    Click On The Players Button
    Sleep   5
    Click On The Sign Out Button
    Sleep   3
    [Teardown]    Close Browser

Add a new player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Dashboard
    Sleep    3
    Click On The Add Player Button
    Sleep   3
    Type In Name
    Type In Surname
    Type In Age
    Type In Main Position
    Sleep    3
    Click on the submit button
    Sleep   3
    [Teardown]    Close Browser

Add new player invalid name
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Dashboard
    Sleep    3
    Click On The Add Player Button
    Sleep   3
    Type In Invalid Name
    Type In Surname
    Type In Age
    Type In Main Position
    Sleep    3
    Click on the submit button
    Sleep   3
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser      ${LOGIN URL}     ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${LOGINFIELD}       user04@getnada.com
Type in password
    Input Text       ${PASSWORDFIELD}        Test-1234
Click on the Sign in button
    Click Element       //*[text()='Sign in']
Click on the Sign out button
    Click Element      //span[text()='Sign out']/../*[@class="MuiTypography-root MuiListItemText-primary MuiTypography-body1 MuiTypography-displayBlock"]
Click On The Players Button
    Click Element       //*[text() = 'Players']
Type in search search name
    Input Text        ${SEARCHFIELD}        Native
Click On The Add Player Button
    Click Element      //*[text()='Add player']/../*[@class='MuiButton-label']


Type In Name
    Input Text         ${NAMEFIELD}        Native
Type In Surname
    Input Text         ${SURNAMEFIELD}      Land
Type In Age
    Input Text         ${AGEFIELD}          03.05.1992
Type In Main Position
    Input Text         ${MAINPOSITION}      1
Click on the submit button
    Click Element       //*[text()='Submit']
Type In Invalid Name
    Input Text         ${INVALIDNAMEFIELD}        15
Assert dashboard
    wait until element is visible    ${TITLEOFBOX}
    title should be    Scouts panel - sign in
    Capture Page Screenshot    alert.png







