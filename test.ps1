
# # test.ps1
# $response = Invoke-WebRequest -Uri http://localhost:8090 -UseBasicParsing

# if ($response.StatusCode -eq 200 -and $response.Content -match "Welcome") {
#     Write-Output "✅ Test passed: Site is running and content is valid"
#     exit 0
# } else {
#     Write-Output "Test failed"
#     exit 1
# }
# test.ps1
$html = Invoke-WebRequest -Uri http://localhost:8090/test.html -UseBasicParsing
if ($html.Content -match "❌") {
    Write-Output "❌ Test Failed"
    exit 1
} else {
    Write-Output "✅ All tests passed!"
}

