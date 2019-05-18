Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '400,400'
$Form.text                       = "Veeam Database Backup"
$Form.TopMost                    = $false

$L_SelectBackup1                 = New-Object system.Windows.Forms.Label
$L_SelectBackup1.text            = "Choose the Databases you want to backup: "
$L_SelectBackup1.AutoSize        = $true
$L_SelectBackup1.width           = 25
$L_SelectBackup1.height          = 10
$L_SelectBackup1.location        = New-Object System.Drawing.Point(11,20)
$L_SelectBackup1.Font            = 'Microsoft Sans Serif,10'

$CB_VBR1                       = New-Object system.Windows.Forms.Checkbox
$CB_VBR1.text                  = "Veeam Backup and Replication"
$CB_VBR1.width                 = 250
$CB_VBR1.height                = 25
$CB_VBR1.location              = New-Object System.Drawing.Point(11,65)
$CB_VBR1.Font                  = 'Microsoft Sans Serif,10'

$CB_VEM1                       = New-Object system.Windows.Forms.Checkbox
$CB_VEM1.text                  = "Veeam Enterprise Manager"
$CB_VEM1.width                 = 250
$CB_VEM1.height                = 25
$CB_VEM1.location              = New-Object System.Drawing.Point(11,105)
$CB_VEM1.Font                  = 'Microsoft Sans Serif,10'

$CB_VONE1                       = New-Object system.Windows.Forms.Checkbox
$CB_VONE1.text                  = "Veeam ONE"
$CB_VONE1.width                 = 250
$CB_VONE1.height                = 25
$CB_VONE1.location              = New-Object System.Drawing.Point(11,145)
$CB_VONE1.Font                  = 'Microsoft Sans Serif,10'

$BU_Folder1                         = New-Object system.Windows.Forms.Button
$BU_Folder1.text                    = "Choose Backup Folder..."
$BU_Folder1.width                   = 350
$BU_Folder1.height                  = 30
$BU_Folder1.location                = New-Object System.Drawing.Point(11,185)
$BU_Folder1.Font                    = 'Microsoft Sans Serif,10'

$RB_WinAuth1                    = New-Object System.Windows.Forms.RadioButton 
$RB_WinAuth1.text               = "Windows Authentication"
$RB_WinAuth1.AutoSize           = $true
$RB_WinAuth1.width              = 25
$RB_WinAuth1.height             = 10
$RB_WinAuth1.location           = New-Object System.Drawing.Point(11,265)
$RB_WinAuth1.Font               = 'Microsoft Sans Serif,10'
$RB_WinAuth1.Checked            = $true

$RB_SQLAuth1                    = New-Object System.Windows.Forms.RadioButton 
$RB_SQLAuth1.text               = "SQL Authentication"
$RB_SQLAuth1.AutoSize           = $true
$RB_SQLAuth1.width              = 25
$RB_SQLAuth1.height             = 10
$RB_SQLAuth1.location           = New-Object System.Drawing.Point(211,265)
$RB_SQLAuth1.Font               = 'Microsoft Sans Serif,10'
$RB_SQLAuth1.Checked            = $false

$TB_UserName1                        = New-Object System.Windows.Forms.TextBox
$TB_UserName1.text                   = "Input Username"
$TB_UserName1.AutoSize                = $true
$TB_UserName1.width                  = 130
$TB_UserName1.height                 = 15
$TB_UserName1.location               = New-Object System.Drawing.Point(11,305)
$TB_UserName1.Font                   = 'Microsoft Sans Serif,10'

$TB_Password1                        = New-Object System.Windows.Forms.TextBox
$TB_Password1.text                   = "Input Password"
$TB_Password1.AutoSize               = $true
$TB_Password1.width                  = 130
$TB_Password1.height                 = 15
$TB_Password1.location               = New-Object System.Drawing.Point(152,305)
$TB_Password1.Font                   = 'Microsoft Sans Serif,10'

$BU_Start1                         = New-Object system.Windows.Forms.Button
$BU_Start1.text                    = "Start"
$BU_Start1.width                   = 80
$BU_Start1.height                  = 30
$BU_Start1.location                = New-Object System.Drawing.Point(210,360)
$BU_Start1.Font                    = 'Microsoft Sans Serif,10'

$BU_Cancel1                         = New-Object system.Windows.Forms.Button
$BU_Cancel1.text                    = "Cancel"
$BU_Cancel1.width                   = 80
$BU_Cancel1.height                  = 30
$BU_Cancel1.location                = New-Object System.Drawing.Point(300,360)
$BU_Cancel1.Font                    = 'Microsoft Sans Serif,10'

$Global:BackupFolder = $null

$Form.controls.AddRange(@($L_SelectBackup1,$CB_VBR1,$CB_VEM1,$CB_VONE1,$RB_WinAuth1,$RB_SQLAuth1,$BU_Folder1,$BU_Start1,$BU_Cancel1))

$RB_WinAuth1.Add_CheckedChanged({
    if ($RB_SQLAuth1.Checked -eq "True"){
        $Form.controls.Add($TB_UserName1)
        $Form.controls.Add($TB_Password1)
        $TB_UserName1.text = "Input Username"
        $TB_Password1.text = "Input Password"
    }
    else {
        $Form.controls.Remove($TB_UserName1)
        $Form.controls.Remove($TB_Password1)        
    }
})
$TB_UserName1.Add_Click({
    if ($TB_UserName1.Text -eq "Input Username"){
        $TB_UserName1.Text =""
    }
})
$TB_Password1.Add_Click({
    if ($TB_Password1.Text -eq "Input Password"){
        $TB_Password1.Text =""
    }
})
$BU_Folder1.Add_Click({   
    $BD_ChooseFolder       = New-Object System.Windows.Forms.FolderBrowserDialog
    [void]$BD_ChooseFolder.ShowDialog()
    $Global:BackupFolder       = $BD_ChooseFolder.SelectedPath
    if (!$Global:BackupFolder){
        $BU_Folder1.Text       = "No folder selected"
    }
    else{
        $BU_Folder1.Text       = "Backup folder selected"
    }
})
$BU_Start1.Add_Click({
    if ($RB_WinAuth1.Checked -eq "True"){
        if (!$CB_VBR1.Checked -and !$CB_VEM1.Checked -and !$CB_VONE1.Checked){
            [System.Windows.Forms.MessageBox]::Show("No Veeam Database selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
        }
        if ($BU_Folder1.Text -ne "Backup folder selected"){
            [System.Windows.Forms.MessageBox]::Show("No Folder for Backup selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
        }
        if ($CB_VBR1.Checked -eq "True"){    
            try{  
                $VBRSQLDBName = (get-item  -ErrorAction -Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlDatabaseName")
                $VBRSQLInstanceName = (get-item -"HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlInstanceName")
                $VBRSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlServerName")

                $BackupFilePath = $Global:BackupFolder + "\"+ $VBRSQLDBName + ".bak"       
                $BackupQuery = "BACKUP DATABASE $VBRSQLDBName TO DISK = '$BackupFilePath'"
                try{
                    Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VBRSQLServerName\$VBRSQLInstanceName -Database $VBRSQLDBName -Query $BackupQuery 
                    [System.Windows.Forms.MessageBox]::Show("Veeam BR backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)            
                }
                catch{
                    [System.Windows.Forms.MessageBox]::Show("Unable to create VBR database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                }
            }
            catch{
                [System.Windows.Forms.MessageBox]::Show("No Veeam BR installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)        
            }
        }
        if ($CB_VEM1.Checked -eq "True"){
            try{
                $VEMSQLDBName = (get-item -ErrorAction -Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlDatabaseName")
                $VEMSQLInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlInstanceName")
                $VEMSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlServerName")

                $BackupFilePath = $Global:BackupFolder + "\"+ $VEMSQLDBName + ".bak"       
                $BackupQuery = "BACKUP DATABASE $VEMSQLDBName TO DISK = '$BackupFilePath'"
                try{
                    Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VEMSQLServerName\$VEMSQLInstanceName -Database $VEMSQLDBName -Query $BackupQuery
                    [System.Windows.Forms.MessageBox]::Show("Veeam EM backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)               
                }
                catch{
                    [System.Windows.Forms.MessageBox]::Show("Unable to create VEM database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                }
            }
            catch{
                [System.Windows.Forms.MessageBox]::Show("No Veeam EM installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)        
            }
        }
        if ($CB_VONE1.Checked -eq "True") {
            try{
                $VONESQLDBName = (get-item -ErrorAction -Stop "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("db_name")
                $VONESQLServerAndInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("host")
                
                $BackupFilePath = $Global:BackupFolder + "\"+ $VONESQLDBName + ".bak"       
                $BackupQuery = "BACKUP DATABASE $VONESQLDBName TO DISK = '$BackupFilePath'"
                try{
                    Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VONESQLServerAndInstanceName -Database $VONESQLDBName -Query $BackupQuery
                    [System.Windows.Forms.MessageBox]::Show("Veeam ONE backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)               
                }
                catch{
                    [System.Windows.Forms.MessageBox]::Show("Unable to create Veeam ONE database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                }
            }
            catch{
                [System.Windows.Forms.MessageBox]::Show("No Veeam ONE installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)        
            }
        }
        $Form.Dispose()
    }
    else {
        $UserName = $TB_UserName1.Text
        $Password = $TB_Password1.Text

        if (!$CB_VBR1.Checked -and !$CB_VEM1.Checked -and !$CB_VONE1.Checked){
            [System.Windows.Forms.MessageBox]::Show("No Veeam Database selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
        }
        if ($BU_Folder1.Text -ne "Backup folder selected"){
            [System.Windows.Forms.MessageBox]::Show("No Folder for Backup selected!", "Warning", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
        }
        if ($CB_VBR1.Checked -eq "True"){    
            try{  
                $VBRSQLDBName = (get-item  -ErrorAction -Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlDatabaseName")
                $VBRSQLInstanceName = (get-item -"HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlInstanceName")
                $VBRSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup and Replication\").GetValue("SqlServerName")

                $BackupFilePath = $Global:BackupFolder + "\"+ $VBRSQLDBName + ".bak"       
                $BackupQuery = "BACKUP DATABASE $VBRSQLDBName TO DISK = '$BackupFilePath'"
                try{
                    Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VBRSQLServerName\$VBRSQLInstanceName -Database $VBRSQLDBName -Username $UserName -Password $Password -Query $BackupQuery 
                    [System.Windows.Forms.MessageBox]::Show("Veeam BR backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)            
                }
                catch{
                    [System.Windows.Forms.MessageBox]::Show("Unable to create VBR database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                }
            }
            catch{
                [System.Windows.Forms.MessageBox]::Show("No Veeam BR installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)        
            }
        }
        if ($CB_VEM1.Checked -eq "True"){
            try{
                $VEMSQLDBName = (get-item -ErrorAction -Stop "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlDatabaseName")
                $VEMSQLInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlInstanceName")
                $VEMSQLServerName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam Backup Reporting\").GetValue("SqlServerName")

                $BackupFilePath = $Global:BackupFolder + "\"+ $VEMSQLDBName + ".bak"       
                $BackupQuery = "BACKUP DATABASE $VEMSQLDBName TO DISK = '$BackupFilePath'"
                try{
                    Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VEMSQLServerName\$VEMSQLInstanceName -Database $VEMSQLDBName -Username $UserName -Password $Password -Query $BackupQuery
                    [System.Windows.Forms.MessageBox]::Show("Veeam EM backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)               
                }
                catch{
                    [System.Windows.Forms.MessageBox]::Show("Unable to create VEM database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                }
            }
            catch{
                [System.Windows.Forms.MessageBox]::Show("No Veeam EM installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)        
            }
        }
        if ($CB_VONE1.Checked -eq "True") {
            try{
                $VONESQLDBName = (get-item -ErrorAction -Stop "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("db_name")
                $VONESQLServerAndInstanceName = (get-item "HKLM:\SOFTWARE\Veeam\Veeam ONE Monitor\db_config\").GetValue("host")
                
                $BackupFilePath = $Global:BackupFolder + "\"+ $VONESQLDBName + ".bak"       
                $BackupQuery = "BACKUP DATABASE $VONESQLDBName TO DISK = '$BackupFilePath'"
                try{
                    Invoke-Sqlcmd -ErrorAction Stop -ServerInstance $VONESQLServerAndInstanceName -Database $VONESQLDBName -Username $UserName -Password $Password -Query $BackupQuery
                    [System.Windows.Forms.MessageBox]::Show("Veeam ONE backup created!", "Sucess", 0, [System.Windows.Forms.MessageBoxIcon]::Information)               
                }
                catch{
                    [System.Windows.Forms.MessageBox]::Show("Unable to create Veeam ONE database backup!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
                }
            }
            catch{
                [System.Windows.Forms.MessageBox]::Show("No Veeam ONE installation found in registry!", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)        
            }
        }
        $Form.Dispose()
    }
})
$BU_Cancel1.Add_Click({   
    $Form.Dispose()
})
[void]$Form.ShowDialog()