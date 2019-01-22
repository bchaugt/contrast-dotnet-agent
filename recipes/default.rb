#
# Cookbook:: contrast-dotnet-agent
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Download Contrast .NET agent
powershell_script 'download_contrast_dotnet_agent' do
    code <<-EOH
    $headers = @{'Authorization'='ZGVtby5wZXJzb25AY29udHJhc3RzZWN1cml0eS5jb206TzUwVVJNTVRaRFJaVkYxMw==';'API-Key'='XcE6RIo6GcG4avzN'}
    $outfile = 'C:\\Users\\Administrator\\Downloads\\ContrastSetup.exe'
    Invoke-RestMethod -Uri http://localhost/Contrast/api/ng/3f6fb3c2-aade-4f30-8980-ef7e12ef9887/agents/default/dotnet -Method Get -Headers $headers -OutFile $outfile
    EOH
end
# powershell_script 'write-to-interpolated-path' do
#     code <<-EOH
#     Invoke-RestMethod -Uri http://localhost/Contrast/api/ng/3f6fb3c2-aade-4f30-8980-ef7e12ef9887/agents/default/dotnet -Method Get -Headers $headers -OutFile "C:\Users\Administrator\Downloads\ContrastSetup.exe"
#     EOH
# end
# execute 'Invoke-RestMethod -Uri http://localhost/Contrast/api/ng/3f6fb3c2-aade-4f30-8980-ef7e12ef9887/agents/default/dotnet -Method Get -Headers $headers -OutFile C:\Users\Administrator\Downloads\ContrastSetup.exe'
# powershell_script 'write-to-interpolated-path' do
#     code <<-EOH
#     $headers = @{'Authorization'='ZGVtby5wZXJzb25AY29udHJhc3RzZWN1cml0eS5jb206TzUwVVJNTVRaRFJaVkYxMw==';'API-Key'='XcE6RIo6GcG4avzN'}
#     Invoke-RestMethod -Uri http://localhost/Contrast/api/ng/3f6fb3c2-aade-4f30-8980-ef7e12ef9887/agents/default/dotnet -Method Get -Headers $headers -OutFile C:\Users\Administrator\Downloads\ContrastSetup.exe
#     EOH
# end

# Execute the Contrast .NET installer in silent mode
execute 'install_contrast_dotnet_agent' do
    command 'ContrastSetup.exe -s -norestart'
    cwd 'C:\Users\Administrator\Downloads\dotnet_contrast_18.7.18'
end