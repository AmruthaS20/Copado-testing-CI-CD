*** Settings ***

Library    BuiltIn
Resource   ../resources/common.robot

*** Test Cases ***

CI CD pipeline validation

    Should Be Equal As Strings   Completed    rejected

    Log    CRT pipeline executed successfully
 
