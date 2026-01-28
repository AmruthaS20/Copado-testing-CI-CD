*** Settings ***
Library    OperatingSystem
Library    QForce
Library    QWeb
Library    Collections
Resource    ../resources/common.robot
Suite Setup    OpenBrowser    ${URL}    chrome
Suite Teardown   Close Browser

*** Variables ***
${URL}    https://login.salesforce.com

*** Test Cases ***
CI-CD pipeline validation
    
     Appstate        Login     
     Verify Text     User Stories
     Click Text       User Stories    Delay=10
     
   #validate the user story is completed  


    ${us_id}=        Get Text    //table//a[contains(@title,'US-')]  
    ${record_type}=              Get Text    //table//a[@title\='User Story']
    ${title}=                    Get Text    //span[contains(normalize-space(),'ci-cd')]
    ${feature}=                  Get Text    //table//a[@title\='validation']
    ${epic}=                     Get Text    //table//a[@title\='E0000001']
    ${theme}=                    Get Text    //table//a[@title\='code']
    ${project}=                  Get Text     //table//a[@title\='testing']
    ${status}=                   Get Text     //table//td[@data-label='Status']//span

    ${US_data}                   Create Dictionary
    ...                        us_id=${us_id}
    ...                        record_type=${record_type}
    ...                        title=${title}
    ...                        feature=${feature}
    ...                        epic=${epic}
    ...                        theme=${theme}}
    ...                        project=${project}
    ...                        tatus=${status}
    Log                        us_data: ${us_data}
    
    Should Be Equal As Strings    ${status}    Completed
