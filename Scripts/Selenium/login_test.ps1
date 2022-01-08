
function Import-SeleniumModule()
{
    if(!(Get-Module -Name Selenium)){
        Install-Module Selenium -Confirm:$false
    }
    else
    {
        Import-Module Selenium
    }
}

function Clear-Elements(){
    $Username.Clear()
    $Password.Clear()
}

function TestWrongPassword(){

    Send-SeKeys -Element $Username -Keys "admin"
    Send-SeKeys -Element $Password -Keys "wrongPassword"
    Invoke-SeClick -Element $Button

    return $Result.Text -eq "Login Failed!"
}

function TestCorrectPassword(){

    Send-SeKeys -Element $Username -Keys "admin"
    Send-SeKeys -Element $Password -Keys "admin"
    Invoke-SeClick -Element $Button

    return $Result.Text -eq "Success!"
}

function TestCancelButton(){
    Invoke-SeClick -Element $CancelBtn
    return ($Username.Text -eq "" -and $Password.Text -eq "")
}

function Assert-Test($TestResult)
{
    if(!$TestResult){
        Write-Host "Test has failed!"
        exit 1
    }
    Write-Host "Test passed!"
}

function Verify-Test($TestResult)
{
    if(!$TestResult)
    {
        Write-Host "Test has failed!"
    }
}

Import-SeleniumModule

# To start a Chrome Driver
$Driver = Start-SeFirefox -StartURL "http://localhost:8888/login"
$Username = Find-SeElement -By Id -Selection "username" -Target $Driver
$Password = Find-SeElement -By Id -Selection "password" -Target $Driver
$Button = Find-SeElement -By Id -Selection "login-btn" -Target $Driver
$Result = Find-SeElement -By Id -Selection "result" -Target $Driver
$CancelBtn = Find-SeElement -By ClassName -Selection "cancelbtn" -Target $Driver

$Test1 = TestCorrectPassword
Assert-Test $Test1
Start-Sleep -Seconds 1
$Test2 =TestCancelButton
Assert-Test $Test2
Start-Sleep -Seconds 1
$Test3 = TestWrongPassword
Assert-Test $Test3

Write-Host "All tests have passed!"
exit 0