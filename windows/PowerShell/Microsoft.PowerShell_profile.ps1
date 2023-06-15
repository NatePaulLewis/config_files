
# set PowerShell to UTF-8-----------------------------------------------------------------------------------------
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Env-----------------------------------------------------------------------------------------
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# posh-git -----------------------------------------------------------------------------------------
Import-Module posh-git

# oh-my-posh-----------------------------------------------------------------------------------------
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/star.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\Nate Lewis\AppData\Local\Programs\oh-my-posh\themes\stelbent-compact.minimal.omp.json' | Invoke-Expression

# Terminal Icons-----------------------------------------------------------------------------------------
Import-Module -Name Terminal-Icons

#PS ReadLine -----------------------------------------------------------------------------------------
Import-Module -Name PSReadLine
Set-PSReadLineOption -PredictionSource History 
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None

#Fzf-----------------------------------------------------------------------------------------
Import-Module PSfzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' 
Set-PsFzfOption -PSReadLineChordReverseHistory 'Ctrl+r'


# Alias-----------------------------------------------------------------------------------------
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias touch New-Item
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias 3dsmax2022 "C:\Program Files\Autodesk\3ds Max 2022\3dsmax.exe"
Set-Alias photoshop "C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe"
Set-Alias illustrator "C:\Program Files\Adobe\Adobe Illustrator 2023\Support Files\Contents\Windows\Illustrator.exe"
Set-Alias indesign "C:\Program Files\Adobe\Adobe InDesign 2023\InDesign.exe"
Set-Alias bridge "C:\Program Files\Adobe\Adobe Bridge 2023\Adobe Bridge.exe"
Set-Alias chrome "C:\Program Files\Google\Chrome\Application\chrome.exe"
Set-Alias ableton "C:\ProgramData\Ableton\Live 11 Suite\Program\Ableton Live 11 Suite.exe"
Set-Alias sketchup "C:\Program Files\SketchUp\SketchUp 2021\SketchUp.exe"
Set-Alias premiere "C:\Program Files\Adobe\Adobe Premiere Pro 2023\Adobe Premiere Pro.exe"
Set-Alias signal "C:\Users\Nate Lewis\AppData\Local\Programs\signal-desktop\Signal.exe"
Set-Alias minifuse "C:\Program Files (x86)\Arturia\MiniFuse Control Center\MiniFuse Control Center.exe"
Set-Alias obs "C:\Program Files\obs-studio\bin\64bit\obs64.exe"
Set-Alias powertoys "C:\Program Files\PowerToys\PowerToys.exe"
Set-Alias mozilla "C:\Program Files\Mozilla Firefox\private_browsing.exe"
Set-Alias dropbox "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
Set-Alias fusion "C:\Program Files\Blackmagic Design\Fusion 17\Fusion.exe"
Set-Alias shutdown "shutdown /s"
Set-Alias restart "shutdown /r"
# Set-Alias hibernate "rundll32.exe powrprof.dll, SetSuspendState Sleep"

# Utilities-----------------------------------------------------------------------------------------
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

New-Alias -Name ExpandAll -Value "Get-ChildItem -Path .\my_folder\* -Recurse -File | ForEach-Object {Expand-Archive -Path $_.FullName -DestinationPath $_.DirectoryName}"


# Sleep-----------------------------------------------------------------------------------------
function Sleep-Computer {
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;

        public class Power
        {
            [DllImport("powrprof.dll", SetLastError = true)]
            public static extern bool SetSuspendState(bool hibernate, bool forceCritical, bool disableWakeEvent);
        }
"@
    [Power]::SetSuspendState($false, $false, $false)
}
Set-Alias -Name hibernate -Value Sleep-Computer

