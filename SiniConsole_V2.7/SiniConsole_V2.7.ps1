### Sini Console ###
### V2.7 ###

#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 3cb5e444-0af7-47a6-b58a-a544bff30aac
# Source File: \tabcontrol.psf
#------------------------------------------------------------------------


#----------------------------------------------
#region Application Functions
#----------------------------------------------

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-tabcontrol_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.ServiceProcess, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$form1 = New-Object 'System.Windows.Forms.Form'
	$tabcontrol1 = New-Object 'System.Windows.Forms.TabControl'
	$tabpage1 = New-Object 'System.Windows.Forms.TabPage'
	$tabpage2 = New-Object 'System.Windows.Forms.TabPage'
	$tabpage3 = New-Object 'System.Windows.Forms.TabPage'
	$tabpage4 = New-Object 'System.Windows.Forms.TabPage'
	$tabpage5 = New-Object 'System.Windows.Forms.TabPage'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$form1_Load={
		
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$form1.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$form1.remove_Load($form1_Load)
			$form1.remove_Load($Form_StateCorrection_Load)
			$form1.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null  }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$form1.SuspendLayout()
	$tabcontrol1.SuspendLayout()
	#
	# form1
	#
	$form1.Controls.Add($tabcontrol1)
	$form1.AutoScaleDimensions = '6, 13'
	$form1.AutoScaleMode = 'Font'
	$form1.ClientSize = '1000, 600'
	$form1.Name = 'form1'
	$form1.Text = 'Sini Console'
$Form1.FormBorderStyle = 'Fixed3D'
	$form1.add_Load($form1_Load)
	#
	# tabcontrol1
	#
	$tabcontrol1.Controls.Add($tabpage1)
	$tabcontrol1.Controls.Add($tabpage2)
	$tabcontrol1.Alignment = 'top'
	$tabcontrol1.Location = '5, 5'
	$tabcontrol1.Multiline = $True
	$tabcontrol1.Name = 'tabcontrol1'
	$tabcontrol1.SelectedIndex = 0
	$tabcontrol1.Size = '990, 590'
	$tabcontrol1.TabIndex = 0
	#
	# tabpage1
	#
	$tabpage1.Location = '42, 4'
	$tabpage1.Name = 'Get-ADuser'
	$tabpage1.Padding = '3, 3, 3, 3'
	$tabpage1.Size = '583, 442'
	$tabpage1.TabIndex = 0
	$tabpage1.Text = 'Get-ADuser'
	$tabpage1.UseVisualStyleBackColor = $True
	#
#
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the Name in the space below:'
$tabpage1.Controls.Add($Label)
#
$InputTextBox = New-Object System.Windows.Forms.RichTextBox
$InputTextBox.Location = New-Object System.Drawing.Point(10,40)
$InputTextBox.Size = New-Object System.Drawing.Size(260,30)
$InputTextBox.Font = New-Object System.Drawing.Font("Lucida Console",14,[System.Drawing.FontStyle]::Italic::bold)
$InputTextBox.BackColor = "LightGreen"
$tabpage1.Controls.Add($InputTextBox)
#
$OutputTextBox = New-Object System.Windows.Forms.RichTextBox
$OutputTextBox.Location = New-Object System.Drawing.Point(10,100)
$OutputTextBox.Size = New-Object System.Drawing.Size(810,450)
$OutputTextBox.Multiline = $true
$OutputTextBox.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Italic::bold)
$OutputTextBox.ForeColor = "darkblue"
$OutputTextBox.BackColor = "dimgray"
$OutputTextBox.WordWrap = $false
$tabpage1.Controls.Add($OutputTextBox)
#
$InfoTextBox = New-Object System.Windows.Forms.RichTextBox
$InfoTextBox.Location = New-Object System.Drawing.Point(450,10)
$InfoTextBox.Size = New-Object System.Drawing.Size(500,80)
$InfoTextBox.Multiline = $true
$InfoTextBox.Font = New-Object System.Drawing.Font("Lucida Console",8,[System.Drawing.FontStyle]::Italic)
$InfoTextBox.ForeColor = "black"
$InfoTextBox.BackColor = "lightgray"
$InfoTextBox.WordWrap = $false
#$InfoTextBox.Enabled = $false
$InfoTextBox.Text = "* ActiveDirectory module has to be installed
(import-module activedirectory)

* ShowUi module has to be installed 
(install-module showui)

* RTM (Instructions_VersionInfo.txt)"
$tabpage1.Controls.Add($InfoTextBox)
#
$Btn1 = New-Object System.Windows.Forms.Button
$Btn1.Size = New-Object System.Drawing.Size (100,40)
$Btn1.Add_Click({ $script:InputString = $InputTextBox.Text })
$Btn1.add_click({$OutputTextBox.Text += Get-ADUser -Filter "name -like '$InputString*'" -Properties * | 
fl empl*, title, div*, sam*, disp*, mail*, manager*, depa*, giv*, l, last*,objUser.LogonCount*, when*  | fl  | Out-String})
$Btn1.Text = "Get User Info"
$Btn1.Location = '850,500'
$Btn1.BackColor = "wheat"
$Btn1.Font = "Lucida Console"
$tabpage1.Controls.Add($Btn1)
#
$Btn2 = New-Object System.Windows.Forms.Button
$Btn2.Size = New-Object System.Drawing.Size (100,40)
$Btn2.Add_Click({ $global:InputString = $InputTextBox.Text })
$Btn2.Add_Click({function UserGroupsMembership {$UserName = Get-ADUser -Filter "name -like '$InputString*'" -Properties * | select -ExpandProperty SamAccountName;
                                                $Groups = Get-ADPrincipalGroupMembership $UserName | select name ; $Groups}
                                                $Global:UserGroups = UserGroupsMembership})
$Btn2.add_click({$OutputTextBox.Text += $UserGroups | fl | Out-String})
$Btn2.Text = "Get User Groups"
$Btn2.Location = '850,430'
$Btn2.BackColor = "wheat"
$Btn2.Font = "Lucida Console"
$tabpage1.Controls.Add($Btn2)
#
$Btn3 = New-Object System.Windows.Forms.Button
$Btn3.Size = New-Object System.Drawing.Size (100,40)
$Btn3.Add_Click({ $script:InputString = $InputTextBox.Text })
$Btn3.add_click({$OutputTextBox.Text += Get-ADComputer -Filter "name  -like '$InputString*'" -Properties * | 
select CN, name, DNShostname, IPv4Address, LastLogonDate, Location, LogonCount, objectclass, operatingsystem, operatingsystemversion, primarygroup | fl  | Out-String})
$Btn3.Text = "Get Computer Info"
$Btn3.Location = '850,360'
$Btn3.BackColor = "wheat"
$Btn3.Font = "Lucida Console"
$tabpage1.Controls.Add($Btn3)
#
$Btn4 = New-Object System.Windows.Forms.Button
$Btn4.Size = New-Object System.Drawing.Size (100,30)
$Btn4.Add_Click({ $script:InputString = $InputTextBox.Text })
$Btn4.add_click({$OutputTextBox.Text =  fl  | Out-String})
$Btn4.Text = "Clear Screen"
$Btn4.Location = '300,40'
$Btn4.BackColor = "red"
$Btn4.Font = "Lucida Console"
$tabpage1.Controls.Add($Btn4)
#
$Btn5 = New-Object System.Windows.Forms.Button
$Btn5.Size = New-Object System.Drawing.Size (100,40)
$Btn5.Add_Click({ $script:InputString = $InputTextBox.Text })
$Btn5.add_click({$OutputTextBox.Text += Invoke-Command -ComputerName $InputString -ScriptBlock {Get-Process} | ft -AutoSize | Out-String  })
$Btn5.Text = "Get Process on remote machine"
$Btn5.Location = '850,290'
$Btn5.BackColor = "wheat"
$Btn5.Font = "Lucida Console"
$tabpage1.Controls.Add($Btn5)
#
	# tabpage2
	#
	$tabpage2.Location = '23, 4'
	$tabpage2.Name = 'Copy files and folders'
	$tabpage2.Padding = '3, 3, 3, 3'
	$tabpage2.Size = '602, 442'
	$tabpage2.TabIndex = 1
	$tabpage2.Text = 'Copy files and folders'
	$tabpage2.UseVisualStyleBackColor = $True
	#
#
$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,20)
$label2.Size = New-Object System.Drawing.Size(280,20)
$label2.Text = 'Source:'
$tabpage2.Controls.Add($label2)
#
$label3 = New-Object System.Windows.Forms.Label
$label3.Location = New-Object System.Drawing.Point(10,90)
$label3.Size = New-Object System.Drawing.Size(280,20)
$label3.Text = 'Destination:'
$tabpage2.Controls.Add($label3)
#
$InputTextBox2 = New-Object System.Windows.Forms.RichTextBox
$InputTextBox2.Location = New-Object System.Drawing.Point(10,40)
$InputTextBox2.Size = New-Object System.Drawing.Size(330,40)
$InputTextBox2.Font = New-Object System.Drawing.Font("Lucida Console",9,[System.Drawing.FontStyle]::Italic)
$InputTextBox2.BackColor = "LightGreen"
$InputTextBox2.WordWrap = $false
$tabpage2.Controls.Add($InputTextBox2)
#
$InputTextBox3 = New-Object System.Windows.Forms.RichTextBox
$InputTextBox3.Location = New-Object System.Drawing.Point(10,110)
$InputTextBox3.Size = New-Object System.Drawing.Size(330,40)
$InputTextBox3.Font = New-Object System.Drawing.Font("Lucida Console",9.5,[System.Drawing.FontStyle]::Italic)
$InputTextBox3.BackColor = "LightGreen"
$InputTextBox3.WordWrap = $false
$tabpage2.Controls.Add($InputTextBox3)
#
$Btn4 = New-Object System.Windows.Forms.Button
$Btn4.Size = New-Object System.Drawing.Size (100,40)
$Btn4.Add_Click({ $global:InputString1 = $InputTextBox2.Text; $global:InputString2 = $InputTextBox3.Text })
$Btn4.Add_Click({function Robo-Copy {
                    robocopy $InputString1 $InputString2 /E /TEE /XO /XD _Personal /R:0 /W:0 #/LOG+:$LogDest\"$env:USERNAME"_"$env:COMPUTERNAME"_RunLog_$Tmstmp.txt
                                     } $Global:UserGroups = Robo-Copy})
$Btn4.add_click({$OutputTextBox2.Text = $UserGroups  | fl | Out-String})
$Btn4.Text = "Copy"
$Btn4.Location = '850,500'
$Btn4.BackColor = "lightblue"
$Btn4.Font = "Lucida Console"
$tabpage2.Controls.Add($Btn4)
#
$Btn5 = New-Object System.Windows.Forms.Button
$Btn5.Size = New-Object System.Drawing.Size (100,40)
#$Btn2.Add_Click({ $global:InputString = $InputTextBox.Text })
$Btn5.Add_Click({$s1 = (Get-WmiObject -List Win32_ShadowCopy).Create("C:\", "ClientAccessible");
                 $s2 = Get-WmiObject Win32_ShadowCopy | Where-Object { $_.ID -eq $s1.ShadowID };
                 $d  = $s2.DeviceObject + "\";   # <-- this here
                 #
                 cmd /c mklink /d C:\shadowcopy "$d"
                 Start-Sleep -s 2 
                 #$s2.Delete()
                 $global:sc22 = $s2 })
$Btn5.add_click({$OutputTextBox2.Text += if (Test-Path "C:\shadowcopy") {"ShadowCopy created, linked to C:\shadowcopy" | fl | Out-String}})
$Btn5.Text = "Create a shadowcopy of C: drive"
$Btn5.Location = '850,430'
$Btn5.BackColor = "lightblue"
$Btn5.Font = "Lucida Console"
$tabpage2.Controls.Add($Btn5)
#
$Btn6 = New-Object System.Windows.Forms.Button
$Btn6.Size = New-Object System.Drawing.Size (100,40)
$Btn6.Add_Click({ $sc22.Delete(); [io.directory]::Delete("C:\shadowcopy") })
$Btn6.add_click({$OutputTextBox2.Text += if (!(Test-Path "C:\shadowcopy")) {"Shadowcopy and junction were deleted" | fl | Out-String}})
$Btn6.Text = "Delete shadow and junction"
$Btn6.Location = '850,360'
$Btn6.BackColor = "lightblue"
$Btn6.Font = "Lucida Console"
$tabpage2.Controls.Add($Btn6)
#
$OutputTextBox2 = New-Object System.Windows.Forms.RichTextBox
$OutputTextBox2.Location = New-Object System.Drawing.Point(10,165)
$OutputTextBox2.Size = New-Object System.Drawing.Size(810,390)
$OutputTextBox2.Multiline = $true
$OutputTextBox2.Font = New-Object System.Drawing.Font("Lucida Console",9,[System.Drawing.FontStyle]::Italic::bold)
$OutputTextBox2.ForeColor = "darkblue"
$OutputTextBox2.BackColor = "dimgray"
$OutputTextBox2.WordWrap = $false
$tabpage2.Controls.Add($OutputTextBox2)
#
$InfoTextBox = New-Object System.Windows.Forms.RichTextBox
$InfoTextBox.Location = New-Object System.Drawing.Point(380,10)
$InfoTextBox.Size = New-Object System.Drawing.Size(600,140)
$InfoTextBox.Multiline = $true
$InfoTextBox.Font = New-Object System.Drawing.Font("Lucida Console",8,[System.Drawing.FontStyle]::Italic)
$InfoTextBox.ForeColor = "black"
$InfoTextBox.BackColor = "lightgray"
$InfoTextBox.WordWrap = $false
#$InfoTextBox.Enabled = $false
$InfoTextBox.Text = "* If the file u r trying to copy is locked\in use, use the shadowcopy option.
(Syntax=C:\shadowcopy\<your shadow C:\>)

* Robocopy used as engine. 
(Parameters applied=/E /TEE /XO /XD _Personal /R:0 /W:0)

* RTM (Instructions_VersionInfo.txt)"
$tabpage2.Controls.Add($InfoTextBox)
#
	#
	$tabcontrol1.ResumeLayout()
	$form1.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $form1.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$form1.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$form1.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $form1.ShowDialog()

} #End Function

#Call the form
Show-tabcontrol_psf | Out-Null



