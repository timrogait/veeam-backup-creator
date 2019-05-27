Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

#Base Form
$Form = New-Object system.Windows.Forms.Form
$Form.ClientSize = '400,530'
$Form.text = "Veeam Database Backup"
$Form.TopMost = $true
$Form.AutoSize = $false
$Form.FormBorderStyle = 'FixedDialog'

$GB_Backup1 = New-Object system.Windows.Forms.Groupbox
$GB_Backup1.height = 155
$GB_Backup1.width = 378
$GB_Backup1.text = "Choose the Databases you want to backup:"
$GB_Backup1.location = New-Object System.Drawing.Point(11, 10)
$GB_Backup1.Font = 'Microsoft Sans Serif,10'

#VBR Backup Checkbox
$CB_VBR1 = New-Object system.Windows.Forms.Checkbox
$CB_VBR1.text = "Veeam Backup and Replication"
$CB_VBR1.width = 250
$CB_VBR1.height = 25
$CB_VBR1.location = New-Object System.Drawing.Point(11, 30)
$CB_VBR1.Font = 'Microsoft Sans Serif,10'

#Veeam Enterprise Manager Backup Checkbox
$CB_VEM1 = New-Object system.Windows.Forms.Checkbox
$CB_VEM1.text = "Veeam Enterprise Manager"
$CB_VEM1.width = 250
$CB_VEM1.height = 25
$CB_VEM1.location = New-Object System.Drawing.Point(11, 60)
$CB_VEM1.Font = 'Microsoft Sans Serif,10'

#Veeam ONE Backup Checkbox
$CB_VONE1 = New-Object system.Windows.Forms.Checkbox
$CB_VONE1.text = "Veeam ONE"
$CB_VONE1.width = 250
$CB_VONE1.height = 25
$CB_VONE1.location = New-Object System.Drawing.Point(11, 90)
$CB_VONE1.Font = 'Microsoft Sans Serif,10'

#Veeam Configuration Backup
$CB_Conf1 = New-Object system.Windows.Forms.Checkbox
$CB_Conf1.text = "Veeam Configuration Backup"
$CB_Conf1.width = 250
$CB_Conf1.height = 25
$CB_Conf1.location = New-Object System.Drawing.Point(11, 120)
$CB_Conf1.Font = 'Microsoft Sans Serif,10'

$GB_Backup2 = New-Object system.Windows.Forms.Groupbox
$GB_Backup2.height = 70
$GB_Backup2.width = 378
$GB_Backup2.text = "Choose the Backup destination:"
$GB_Backup2.location = New-Object System.Drawing.Point(11, 180)
$GB_Backup2.Font = 'Microsoft Sans Serif,10'

$L_SelectFolder1 = New-Object system.Windows.Forms.Label
$L_SelectFolder1.text = "No Backup folder selected"
$L_SelectFolder1.width = 320
$L_SelectFolder1.height = 20
$L_SelectFolder1.location = New-Object System.Drawing.Point(11, 35)
$L_SelectFolder1.Font = 'Microsoft Sans Serif,10'
$L_SelectFolder1.BorderStyle = 'FixedSingle'

# Combined Backup Destination Folder
$BU_Folder1 = New-Object system.Windows.Forms.Button
$BU_Folder1.text = "..."
$BU_Folder1.width = 30
$BU_Folder1.height = 20
$BU_Folder1.location = New-Object System.Drawing.Point(340, 35)
$BU_Folder1.Font = 'Microsoft Sans Serif,10'

$GB_Backup3 = New-Object system.Windows.Forms.Groupbox
$GB_Backup3.height = 110
$GB_Backup3.width = 378
$GB_Backup3.text = "Choose SQL Database Authentication:"
$GB_Backup3.location = New-Object System.Drawing.Point(11, 265)
$GB_Backup3.Font = 'Microsoft Sans Serif,10'

#Windows Database Authentication
$RB_WinAuth1 = New-Object System.Windows.Forms.RadioButton 
$RB_WinAuth1.text = "Windows Authentication"
$RB_WinAuth1.AutoSize = $true
$RB_WinAuth1.width = 25
$RB_WinAuth1.height = 10
$RB_WinAuth1.location = New-Object System.Drawing.Point(11, 30)
$RB_WinAuth1.Font = 'Microsoft Sans Serif,10'
$RB_WinAuth1.Checked = $true

#SQL Database Authentication
$RB_SQLAuth1 = New-Object System.Windows.Forms.RadioButton 
$RB_SQLAuth1.text = "SQL Authentication"
$RB_SQLAuth1.AutoSize = $true
$RB_SQLAuth1.width = 25
$RB_SQLAuth1.height = 10
$RB_SQLAuth1.location = New-Object System.Drawing.Point(211, 30)
$RB_SQLAuth1.Font = 'Microsoft Sans Serif,10'
$RB_SQLAuth1.Checked = $false

$TB_UserName1 = New-Object System.Windows.Forms.TextBox
$TB_UserName1.text = "Input Username"
$TB_UserName1.AutoSize = $false
$TB_UserName1.width = 130
$TB_UserName1.height = 20
$TB_UserName1.location = New-Object System.Drawing.Point(11, 70)
$TB_UserName1.Font = 'Microsoft Sans Serif,10'
$TB_UserName1.Enabled =$false

$TB_Password1 = New-Object System.Windows.Forms.TextBox
$TB_Password1.text = "Input Password"
$TB_Password1.AutoSize = $false
$TB_Password1.width = 130
$TB_Password1.height = 20
$TB_Password1.location = New-Object System.Drawing.Point(152, 70)
$TB_Password1.Font = 'Microsoft Sans Serif,10'
$TB_Password1.Enabled =$false

$GB_Backup4 = New-Object system.Windows.Forms.Groupbox
$GB_Backup4.height = 70
$GB_Backup4.width = 378
$GB_Backup4.text = "Status:"
$GB_Backup4.location = New-Object System.Drawing.Point(11, 385)
$GB_Backup4.Font = 'Microsoft Sans Serif,10'

$L_Status1 = New-Object system.Windows.Forms.Label
$L_Status1.text = "Ready"
$L_Status1.width = 358
$L_Status1.height = 20
$L_Status1.location = New-Object System.Drawing.Point(11, 30)
$L_Status1.Font = 'Microsoft Sans Serif,10'
$L_Status1.BorderStyle = 'FixedSingle'

$BU_Start1 = New-Object system.Windows.Forms.Button
$BU_Start1.text = "Start"
$BU_Start1.width = 80
$BU_Start1.height = 25
$BU_Start1.location = New-Object System.Drawing.Point(219, 490)
$BU_Start1.Font = 'Microsoft Sans Serif,10'

$BU_Cancel1 = New-Object system.Windows.Forms.Button
$BU_Cancel1.text = "Cancel"
$BU_Cancel1.width = 80
$BU_Cancel1.height = 25
$BU_Cancel1.location = New-Object System.Drawing.Point(309, 490)
$BU_Cancel1.Font = 'Microsoft Sans Serif,10'

$Global:BackupFolder = $null
$Global:BackupCounter = "False" #Disposes Window only if Backup was successfull
$Global:Date = Get-Date -f "dd.MM.yyyy_HH.mm.ss"

$Form.controls.AddRange(@($GB_Backup1, $CB_VBR1, $CB_VEM1, $CB_VONE1, $CB_Conf1, $GB_Backup2, $L_SelectFolder1, $BU_Folder1, $GB_Backup3, $RB_WinAuth1, $RB_SQLAuth1, $TB_UserName1, $TB_Password1, $GB_Backup4, $L_Status1, $BU_Start1, $BU_Cancel1))
$GB_Backup1.controls.AddRange(@($CB_VBR1, $CB_VEM1, $CB_VONE1, $CB_Conf1))
$GB_Backup2.controls.AddRange(@($L_SelectFolder1, $BU_Folder1))
$GB_Backup3.controls.AddRange(@($RB_WinAuth1, $RB_SQLAuth1, $TB_UserName1, $TB_Password1))
$GB_Backup4.controls.Add($L_Status1)

#If SQL Auth Checkbox is checked, Username and Password input appear
$RB_WinAuth1.Add_CheckedChanged( {
        if ($RB_SQLAuth1.Checked -eq "True") {
            $TB_UserName1.text = "Input Username"
            $TB_Password1.text = "Input Password"
            $TB_UserName1.Enabled =$true
            $TB_Password1.Enabled = $true
        }
        else {
            $TB_UserName1.text = "Input Username"
            $TB_Password1.text = "Input Password"
            $TB_UserName1.Enabled =$false
            $TB_Password1.Enabled = $false                  
        }
    })
#Click input to remove description 
$TB_UserName1.Add_Click( {
        if ($TB_UserName1.Text -eq "Input Username") {
            $TB_UserName1.Text = ""
        }
    })
#Click input to remove description 
$TB_Password1.Add_Click( {
        if ($TB_Password1.Text -eq "Input Password") {
            $TB_Password1.Text = ""
        }
    })
#Dialog to choose Backup location
$BU_Folder1.Add_Click( {   
        $BD_ChooseFolder = New-Object System.Windows.Forms.FolderBrowserDialog
        [void]$BD_ChooseFolder.ShowDialog()
        $Global:BackupFolder = $BD_ChooseFolder.SelectedPath
        if (!$Global:BackupFolder) {
            $L_SelectFolder1.Text = "No Backup folder selected"
        }
        else {
            $L_SelectFolder1.Text = [string]$Global:BackupFolder
        }
    })
$BU_Start1.Add_Click( {
        $L_Status1.Text = "Running..."
        if ($RB_WinAuth1.Checked -eq "True") {
            #Backup with Win Auth
            if (!$CB_VBR1.Checked -and !$CB_VEM1.Checked -and !$CB_VONE1.Checked -and !$CB_Conf1.Checked) {
                #Nothing checked for backup                
                [System.Windows.Forms.MessageBox]::Show("No Veeam Database selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                $L_Status1.Text = "Stopped with Errors"
            }
            if ($L_SelectFolder1.Text -eq "No Backup folder selected") {
                #No folder selected
                [System.Windows.Forms.MessageBox]::Show("No Folder for Backup selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                $L_Status1.Text = "Stopped with Errors"
            }
            if ($CB_VBR1.Checked -eq "True") {    
                $L_Status1.Text = "Running..."
                try {  
                    $VBRSQLDBName = (get-item  -ErrorAction Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlDatabaseName")
                    $VBRSQLInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlInstanceName")
                    $VBRSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlServerName")

                    $BackupFilePath = $Global:BackupFolder + "\" + $VBRSQLDBName + "-" + $Global:Date + ".bak"       
                    $BackupQuery = "BACKUP DATABASE $VBRSQLDBName TO DISK = '$BackupFilePath'"
                    try {
                        Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VBRSQLServerName\$VBRSQLInstanceName -Database $VBRSQLDBName -Query $BackupQuery 
                        $Global:BackupCounter = "True"                        
                        [System.Windows.Forms.MessageBox]::Show("Veeam BR backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                        $L_Status1.Text = "Successful"           
                    }
                    catch {                        
                        [System.Windows.Forms.MessageBox]::Show("Unable to create VBR database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                        $L_Status1.Text = "Stopped with Errors"
                    }
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("No Veeam BR installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"        
                }
            }
            if ($CB_VEM1.Checked -eq "True") {
                $L_Status1.Text = "Running..."
                try {
                    $VEMSQLDBName = (get-item -ErrorAction Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlDatabaseName")
                    $VEMSQLInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlInstanceName")
                    $VEMSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlServerName")

                    $BackupFilePath = $Global:BackupFolder + "\" + $VEMSQLDBName + "-" + $Global:Date + ".bak"       
                    $BackupQuery = "BACKUP DATABASE $VEMSQLDBName TO DISK = '$BackupFilePath'"
                    try {
                        Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VEMSQLServerName\$VEMSQLInstanceName -Database $VEMSQLDBName -Query $BackupQuery
                        $Global:BackupCounter = "True"                        
                        [System.Windows.Forms.MessageBox]::Show("Veeam EM backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                        $L_Status1.Text = "Successful"               
                    }
                    catch {                        
                        [System.Windows.Forms.MessageBox]::Show("Unable to create VEM database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                        $L_Status1.Text = "Stopped with Errors"
                    }
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("No Veeam EM installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"       
                }
            }
            if ($CB_VONE1.Checked -eq "True") {
                $L_Status1.Text = "Running..."
                try {
                    $VONESQLDBName = (get-item -ErrorAction Stop "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("db_name")
                    $VONESQLServerAndInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("host")
                
                    $BackupFilePath = $Global:BackupFolder + "\" + $VONESQLDBName + "-" + $Global:Date + ".bak"       
                    $BackupQuery = "BACKUP DATABASE $VONESQLDBName TO DISK = '$BackupFilePath'"
                    try {
                        Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VONESQLServerAndInstanceName -Database $VONESQLDBName -Query $BackupQuery
                        $Global:BackupCounter = "True"                        
                        [System.Windows.Forms.MessageBox]::Show("Veeam ONE backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                        $L_Status1.Text = "Successful"               
                    }
                    catch {                        
                        [System.Windows.Forms.MessageBox]::Show("Unable to create Veeam ONE database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                        $L_Status1.Text = "Stopped with Errors"
                    }
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("No Veeam ONE installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"        
                }
            }
            if ($CB_Conf1.Checked -eq "True") {
                $L_Status1.Text = "Running..."
                try {
                    $CurrentConfigBackup = Get-VBRConfigurationBackupJob
                    $CurrentRepository = $CurrentConfigBackup.Target
                    $LocalServer = Get-VBRServer | Where-Object {($_.Type -eq "Local") -and ($_.Description -eq "Backup server")}
                    $TempRepository = Add-VBRBackupRepository -Name "Temp_Repo_$(get-date -f dd.MM.yyyy_HH.mm.ss)" -Server $LocalServer -Folder $Global:BackupFolder -Type WinLocal

                    Set-VBRConfigurationBackupJob -Enable:$true -Repository $TempRepository
                    Start-VBRConfigurationBackupJob
                    Set-VBRConfigurationBackupJob -Repository $CurrentRepository
                    Remove-VBRBackupRepository -Repository $TempRepository -Confirm:$false
                    $Global:BackupCounter = "True"                    
                    [System.Windows.Forms.MessageBox]::Show("Veeam Configuration backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                    $L_Status1.Text = "Successful"               
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("Unable to create Veeam Configuration backup", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"       
                }
            }
            if ($Global:BackupCounter -eq "True") {
                $L_Status1.Text = "Successful and Exiting..."
                Start-Sleep -Seconds 1.5
                $Form.Dispose()
            }
            else {
                $L_Status1.Text = "Stopped"                
            }
        }
        else {
            $UserName = $TB_UserName1.Text
            $Password = $TB_Password1.Text
            $L_Status1.Text = "Running"         
            if (!$CB_VBR1.Checked -and !$CB_VEM1.Checked -and !$CB_VONE1.Checked) {                
                [System.Windows.Forms.MessageBox]::Show("No Veeam Database selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                $L_Status1.Text = "Stopped with Errors"
            }
            if ($BU_Folder1.Text -ne "Backup folder selected") {                
                [System.Windows.Forms.MessageBox]::Show("No Folder for Backup selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                $L_Status1.Text = "Stopped with Errors"
            }
            if ($CB_VBR1.Checked -eq "True") {
                $L_Status1.Text = "Running..."    
                try {  
                    $VBRSQLDBName = (get-item  -ErrorAction Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlDatabaseName")
                    $VBRSQLInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlInstanceName")
                    $VBRSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlServerName")

                    $BackupFilePath = $Global:BackupFolder + "\" + $VBRSQLDBName + "-" + $Global:Date + ".bak"       
                    $BackupQuery = "BACKUP DATABASE $VBRSQLDBName TO DISK = '$BackupFilePath'"
                    try {
                        Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VBRSQLServerName\$VBRSQLInstanceName -Database $VBRSQLDBName -Username $UserName -Password $Password -Query $BackupQuery 
                        $Global:BackupCounter = "True"                        
                        [System.Windows.Forms.MessageBox]::Show("Veeam BR backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                        $L_Status1.Text = "Successful"           
                    }
                    catch {                        
                        [System.Windows.Forms.MessageBox]::Show("Unable to create VBR database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                        $L_Status1.Text = "Stopped with Errors"
                    }
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("No Veeam BR installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"       
                }
            }
            if ($CB_VEM1.Checked -eq "True") {
                $L_Status1.Text = "Running..."
                try {
                    $VEMSQLDBName = (get-item -ErrorAction Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlDatabaseName")
                    $VEMSQLInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlInstanceName")
                    $VEMSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlServerName")

                    $BackupFilePath = $Global:BackupFolder + "\" + $VEMSQLDBName + "-" + $Global:Date + ".bak"       
                    $BackupQuery = "BACKUP DATABASE $VEMSQLDBName TO DISK = '$BackupFilePath'"
                    try {
                        Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VEMSQLServerName\$VEMSQLInstanceName -Database $VEMSQLDBName -Username $UserName -Password $Password -Query $BackupQuery
                        $Global:BackupCounter = "True"                        
                        [System.Windows.Forms.MessageBox]::Show("Veeam EM backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                        $L_Status1.Text = "Successful"              
                    }
                    catch {                        
                        [System.Windows.Forms.MessageBox]::Show("Unable to create VEM database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                        $L_Status1.Text = "Stopped with Errors"
                    }
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("No Veeam EM installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"       
                }
            }
            if ($CB_VONE1.Checked -eq "True") {
                $L_Status1.Text = "Running..."
                try {
                    $VONESQLDBName = (get-item -ErrorAction Stop "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("db_name")
                    $VONESQLServerAndInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("host")
                
                    $BackupFilePath = $Global:BackupFolder + "\" + $VONESQLDBName + "-" + $Global:Date + ".bak"       
                    $BackupQuery = "BACKUP DATABASE $VONESQLDBName TO DISK = '$BackupFilePath'"
                    try {
                        Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VONESQLServerAndInstanceName -Database $VONESQLDBName -Username $UserName -Password $Password -Query $BackupQuery
                        $Global:BackupCounter = "True"                        
                        [System.Windows.Forms.MessageBox]::Show("Veeam ONE backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                        $L_Status1.Text = "Successful"              
                    }
                    catch {                        
                        [System.Windows.Forms.MessageBox]::Show("Unable to create Veeam ONE database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                        $L_Status1.Text = "Stopped with Errors"
                    }
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("No Veeam ONE installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"        
                }
            }
            if ($CB_Conf1.Checked -eq "True") {
                $L_Status1.Text = "Running..."
                try {
                    $CurrentConfigBackup = Get-VBRConfigurationBackupJob
                    $CurrentRepository = $CurrentConfigBackup.Target
                    $LocalServer = Get-VBRServer | Where-Object {($_.Type -eq "Local") -and ($_.Description -eq "Backup server")}
                    $TempRepository = Add-VBRBackupRepository -Name "Temp_Repo_$(get-date -f dd.MM.yyyy_HH.mm.ss)" -Server $LocalServer -Folder $Global:BackupFolder -Type WinLocal

                    Set-VBRConfigurationBackupJob -Enable:$true -Repository $TempRepository
                    Start-VBRConfigurationBackupJob
                    Set-VBRConfigurationBackupJob -Repository $CurrentRepository
                    Remove-VBRBackupRepository -Repository $TempRepository -Confirm:$false
                    $Global:BackupCounter = "True"                    
                    [System.Windows.Forms.MessageBox]::Show("Veeam Configuration backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
                    $L_Status1.Text = "Successful"               
                }
                catch {                    
                    [System.Windows.Forms.MessageBox]::Show("Unable to create Veeam Configuration backup", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                    $L_Status1.Text = "Stopped with Errors"        
                }
            }
            if ($Global:BackupCounter -eq "True") {
                $L_Status1.Text = "Sucessful and Exiting..."
                Start-Sleep -Seconds 1.5
                $Form.Dispose()
            }
            else {
                $L_Status1.Text = "Stopped"                
            }
        }
    })
$BU_Cancel1.Add_Click( {   
        $Form.Dispose()
    })
[void]$Form.ShowDialog()