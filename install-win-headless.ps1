$env:HEADLESS_INSTALL = true
$env:SOFTWARE_GROUP = Standard-Desktop
$env:FULL_NAME = 'Johan Weitner'
$env:PRIMARY_EMAIL = 'johanweitner@gmail.com'
$env:PUBLIC_SERVICES_DOMAIN = 'johan.weitner'
$env:START_REPO = 'johan-weitner/install.doctor'
iex ((New-Object System.Net.WebClient).DownloadString('https://install.doctor/windows'))