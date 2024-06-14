$env:START_REPO = 'johan-weitner/install.doctor'
iex ((New-Object System.Net.WebClient).DownloadString('https://install.doctor/windows'))