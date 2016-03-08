#----------------------------------------------
#region Import Assemblies
#----------------------------------------------
[void][Reflection.Assembly]::Load('mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Data, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][Reflection.Assembly]::Load('System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.DirectoryServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][Reflection.Assembly]::Load('System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.ServiceProcess, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
#endregion Import Assemblies

#Define a Param block to use custom parameters in the project
#Param ($CustomParameter)

function Main {
	Param ([String]$Commandline)
	#Note: This function starts the application
	#Note: $Commandline contains the complete argument string passed to the packager 
	#Note: To get the script directory in the Packager use: Split-Path $hostinvocation.MyCommand.path
	#Note: To get the console output in the Packager (Forms Mode) use: $ConsoleOutput (Type: System.Collections.ArrayList)
	#TODO: Initialize and add Function calls to forms
	
	if((Call-MainForm) -eq "OK")
	{
		
	}
	
	$global:ExitCode = 0 #Set the exit code for the Packager
}
#endregion Source: Startup

#region Source: MainForm
function Call-MainForm
{

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.DirectoryServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.ServiceProcess, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('WindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35')
	[void][reflection.assembly]::Load('System.DirectoryServices.Protocols, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Net, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$MainForm = New-Object 'System.Windows.Forms.Form'
	$comboboxFilter = New-Object 'System.Windows.Forms.ComboBox'
	$datagridview1 = New-Object 'System.Windows.Forms.DataGridView'
	$Restorebutton = New-Object 'System.Windows.Forms.Button'
	$Searchbutton = New-Object 'System.Windows.Forms.Button'
	$statusstrip = New-Object 'System.Windows.Forms.StatusStrip'
	$Mainmenustrip = New-Object 'System.Windows.Forms.MenuStrip'
	$toolstripstatuslabelURL = New-Object 'System.Windows.Forms.ToolStripStatusLabel'
	$toolstripstatuslabelName = New-Object 'System.Windows.Forms.ToolStripStatusLabel'
	$arquivoToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$ajudaToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$sairToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$AboutToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$Searchtoolstripmenuitem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$Gridcontextmenustrip = New-Object 'System.Windows.Forms.ContextMenuStrip'
	$restoreToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$saveReportAsToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$cSVToolStripMenuItem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$savefiledialog = New-Object 'System.Windows.Forms.SaveFileDialog'
	$toolstripseparator1 = New-Object 'System.Windows.Forms.ToolStripSeparator'
	$SaveAstoolstripmenuitem = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$cSVToolStripMenuItem1 = New-Object 'System.Windows.Forms.ToolStripMenuItem'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$OnLoadFormEvent = {
		#TODO: Initialize Form Controls here
		$comboboxFilter.SelectedIndex = 0
	}
	
	$toolstripstatuslabelURL_Click = {
		#TODO: Place custom script here
		Start-Process "http://guidooliveira.com"
	}
	
	$Searchtoolstripmenuitem_Click = {
		#TODO: Place custom script here
		$Searchbutton.PerformClick()
	}
	
	
	$Searchbutton_Click = {
		#TODO: Place custom script here
		if (!([System.String]::IsNullOrEmpty($comboboxFilter.Text)))
		{
			switch ($comboboxFilter.Text)
			{
				'Users' { Load-DataGridView -DataGridView $datagridview1 -Item $(Search-ADDeletedAccounts -ObjectType Users) }
				'Computers' { Load-DataGridView -DataGridView $datagridview1 -Item $(Search-ADDeletedAccounts -ObjectType Computers) }
				'Groups' { Load-DataGridView -DataGridView $datagridview1 -Item $(Search-ADDeletedAccounts -ObjectType Groups) }
				default { Load-DataGridView -DataGridView $datagridview1 -Item $(Search-ADDeletedAccounts -ObjectType Users) }
			}
		}
		else
		{
			[void][System.Windows.Forms.MessageBox]::Show("Choose a Filter Option", "Filter not selected")
		}
	}
	
	
	
	$cSVToolStripMenuItem_Click = {
		#TODO: Place custom script here
		if ($datagridview1.row.count -ne 0)
		{
			$savefiledialog.ShowDialog()
			$(Search-ADDeletedAccounts -ObjectType ($comboboxFilter.Text)) | Export-Csv -Encoding 'UTF8' -UseCulture -Path $savefiledialog.FileName -NoTypeInformation -Force
		}
		else
		{
			[void][System.Windows.Forms.MessageBox]::Show("Can't save an empty result","")
		}
		
	}
	
	$Restorebutton_Click={
		#TODO: Place custom script here
		
		foreach ($row in $datagridview1.SelectedRows)
		{
			$samacc = $row.Cells['SamAccountName'].Value
			try
			{
				Restore-ADDeletedObject -SamAccountName $samacc
				$result = $true
			}
			catch
			{
				$result = $false
				
				[void][System.Windows.Forms.MessageBox]::Show("Error restoring the user $samacc", "Error")
			}
		}
		if ($result)
		{
			[void][System.Windows.Forms.MessageBox]::Show("All Selected Users were Sucessfully restored", "")
		}
		$Searchbutton.PerformClick()
	}
	
	$restoreToolStripMenuItem_Click={
		#TODO: Place custom script here
		$Restorebutton.PerformClick()
	}
	
	$cSVToolStripMenuItem1_Click={
		#TODO: Place custom script here
		$cSVToolStripMenuItem.PerformClick()
	}
	
	$AboutToolStripMenuItem_Click={
		#TODO: Place custom script here
		Call-About
	}
		# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$MainForm.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
		$script:MainForm_comboboxFilter_SelectedItem = $comboboxFilter.SelectedItems
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$Restorebutton.remove_Click($Restorebutton_Click)
			$Searchbutton.remove_Click($Searchbutton_Click)
			$MainForm.remove_Load($OnLoadFormEvent)
			$toolstripstatuslabelURL.remove_Click($toolstripstatuslabelURL_Click)
			$AboutToolStripMenuItem.remove_Click($AboutToolStripMenuItem_Click)
			$Searchtoolstripmenuitem.remove_Click($Searchtoolstripmenuitem_Click)
			$restoreToolStripMenuItem.remove_Click($restoreToolStripMenuItem_Click)
			$cSVToolStripMenuItem.remove_Click($cSVToolStripMenuItem_Click)
			$cSVToolStripMenuItem1.remove_Click($cSVToolStripMenuItem1_Click)
			$MainForm.remove_Load($Form_StateCorrection_Load)
			$MainForm.remove_Closing($Form_StoreValues_Closing)
			$MainForm.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$MainForm.SuspendLayout()
	#
	# MainForm
	#
	$MainForm.Controls.Add($comboboxFilter)
	$MainForm.Controls.Add($datagridview1)
	$MainForm.Controls.Add($Restorebutton)
	$MainForm.Controls.Add($Searchbutton)
	$MainForm.Controls.Add($statusstrip)
	$MainForm.Controls.Add($Mainmenustrip)
	$MainForm.BackColor = 'ControlLightLight'
	$MainForm.ClientSize = '594, 371'
	$MainForm.FormBorderStyle = 'FixedSingle'
	#region Binary Data
	$MainForm.Icon = [System.Convert]::FromBase64String('
AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAMMOAADDDgAAAAAA
AAAAAACMRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/
jEYC/4xGAv+MRgL/jEYC/4xGAv+LRQH/i0UB/4xGAv+MRgL/jEYC/4xFAf+LRAD/i0QA/4tEAP+L
RAD/i0QA/4tFAf+MRgL/jEYC/4xGAv+LRQH/m14j/5pdIf+LRAH/i0UB/4tEAP+eYyr/y6uN/82u
kP/NrpD/za6Q/86vkv+8k2v/jkkG/4xGAv+MRgL/ikMA/7yUbf/v5dv/wpx4/5lbH/+JQgD/pW05
/+PTwv/m1sf/5tbH/+bWx//n2Mr/zrGU/49LCP+MRgL/jEYC/4tEAP+iaTL/3cm1//r39f/u5Nr/
wpx4/5pdIv+PTAr/kEwL/5FODP+RTgz/kU4N/49MCv+MRgL/jEYC/4xGAv+MRgL/i0UB/5BMC/+t
ekr/28Wv//n28v/t49j/wZt2/5laHv+LRAH/i0QA/4xGAf+MRgL/jEYC/4xGAv+MRgL/jEYC/4xG
Av+MRQH/ikMA/49LCf+qdkT/2MCp//j07//t4tj/wZt2/5laHv+MRQL/jEYC/4xGAv+MRgL/jEYC
/4xGAv+MRgL/jEYC/4xGAv+MRgH/ikMA/45JB/+mcDz/2sOt//38+//t4tj/r35P/4tEAP+MRgL/
jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4tEAP+OSQb/qXVC/9/Muf/8+vn/49LB/6dxPf+L
RQD/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/i0QA/4xGA/+iajP/1Lmg//n18f/s4NX/upBn/5NS
Ev+LRAD/jEYC/4xGAv+MRgL/jEYC/4xGAv+LRQH/i0QB/5tfJP/JqYn/9e/p//Ps5f/Go4H/mVoe
/4tEAP+LRQH/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRQH/lFMU/7+Ycv/v5tz/+PTw/9G1mv+gZi7/
i0UC/4tFAf+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/ikMA/7qPZv/7+ff/3Mey/6l0Qf+N
SAb/i0QA/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4tEAP+reEb/tIZZ/5BN
DP+KRAD/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYD
/4tEAP+MRQH/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/
jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+MRgL/jEYC/4xGAv+M
RgL/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAA==')
	#endregion
	$MainForm.MainMenuStrip = $Mainmenustrip
	$MainForm.Name = "MainForm"
	$MainForm.StartPosition = 'CenterScreen'
	$MainForm.Text = "AD Object Restorer"
	$MainForm.add_Load($OnLoadFormEvent)
	#
	# comboboxFilter
	#
	$comboboxFilter.BackColor = 'ControlLightLight'
	$comboboxFilter.DropDownStyle = 'DropDownList'
	$comboboxFilter.FormattingEnabled = $True
	[void]$comboboxFilter.Items.Add("Users")
	[void]$comboboxFilter.Items.Add("Computers")
	[void]$comboboxFilter.Items.Add("Groups")
	$comboboxFilter.Location = '13, 325'
	$comboboxFilter.Name = "comboboxFilter"
	$comboboxFilter.Size = '121, 21'
	$comboboxFilter.TabIndex = 9
	#
	# datagridview1
	#
	$datagridview1.AllowUserToAddRows = $False
	$datagridview1.AllowUserToDeleteRows = $False
	$datagridview1.BackgroundColor = 'ControlLightLight'
	$datagridview1.ColumnHeadersHeightSizeMode = 'AutoSize'
	$datagridview1.ContextMenuStrip = $Gridcontextmenustrip
	$datagridview1.Location = '13, 28'
	$datagridview1.Name = "datagridview1"
	$datagridview1.ReadOnly = $True
	$datagridview1.RowHeadersVisible = $False
	$datagridview1.SelectionMode = 'FullRowSelect'
	$datagridview1.Size = '569, 289'
	$datagridview1.TabIndex = 7
	#
	# Restorebutton
	#
	$Restorebutton.Location = '221, 323'
	$Restorebutton.Name = "Restorebutton"
	$Restorebutton.Size = '75, 23'
	$Restorebutton.TabIndex = 5
	$Restorebutton.Text = "Restore"
	$Restorebutton.UseVisualStyleBackColor = $True
	$Restorebutton.add_Click($Restorebutton_Click)
	#
	# Searchbutton
	#
	$Searchbutton.Location = '140, 323'
	$Searchbutton.Name = "Searchbutton"
	$Searchbutton.Size = '75, 23'
	$Searchbutton.TabIndex = 4
	$Searchbutton.Text = "Search"
	$Searchbutton.UseVisualStyleBackColor = $True
	$Searchbutton.add_Click($Searchbutton_Click)
	#
	# statusstrip
	#
	$statusstrip.BackColor = 'ControlLightLight'
	[void]$statusstrip.Items.Add($toolstripstatuslabelURL)
	[void]$statusstrip.Items.Add($toolstripstatuslabelName)
	$statusstrip.Location = '0, 349'
	$statusstrip.Name = "statusstrip"
	$statusstrip.Size = '594, 22'
	$statusstrip.TabIndex = 1
	#
	# Mainmenustrip
	#
	$Mainmenustrip.BackColor = 'ControlLightLight'
	$Mainmenustrip.BackgroundImageLayout = 'Stretch'
	[void]$Mainmenustrip.Items.Add($arquivoToolStripMenuItem)
	[void]$Mainmenustrip.Items.Add($ajudaToolStripMenuItem)
	$Mainmenustrip.Location = '0, 0'
	$Mainmenustrip.Name = "Mainmenustrip"
	$Mainmenustrip.Size = '594, 24'
	$Mainmenustrip.TabIndex = 2
	$Mainmenustrip.Text = "menustrip1"
	#
	# toolstripstatuslabelURL
	#
	$toolstripstatuslabelURL.IsLink = $True
	$toolstripstatuslabelURL.Name = "toolstripstatuslabelURL"
	$toolstripstatuslabelURL.Size = '106, 17'
	$toolstripstatuslabelURL.Text = "GuidoOliveira.com"
	$toolstripstatuslabelURL.add_Click($toolstripstatuslabelURL_Click)
	#
	# toolstripstatuslabelName
	#
	$toolstripstatuslabelName.Name = "toolstripstatuslabelName"
	$toolstripstatuslabelName.Size = '90, 17'
	$toolstripstatuslabelName.Text = "- Guido Oliveira"
	#
	# arquivoToolStripMenuItem
	#
	$arquivoToolStripMenuItem.BackColor = 'ControlLightLight'
	[void]$arquivoToolStripMenuItem.DropDownItems.Add($SaveAstoolstripmenuitem)
	[void]$arquivoToolStripMenuItem.DropDownItems.Add($Searchtoolstripmenuitem)
	[void]$arquivoToolStripMenuItem.DropDownItems.Add($toolstripseparator1)
	[void]$arquivoToolStripMenuItem.DropDownItems.Add($sairToolStripMenuItem)
	$arquivoToolStripMenuItem.Name = "arquivoToolStripMenuItem"
	$arquivoToolStripMenuItem.Size = '37, 20'
	$arquivoToolStripMenuItem.Text = "File"
	#
	# ajudaToolStripMenuItem
	#
	$ajudaToolStripMenuItem.BackColor = 'ControlLightLight'
	[void]$ajudaToolStripMenuItem.DropDownItems.Add($AboutToolStripMenuItem)
	$ajudaToolStripMenuItem.Name = "ajudaToolStripMenuItem"
	$ajudaToolStripMenuItem.Size = '44, 20'
	$ajudaToolStripMenuItem.Text = "Help"
	#
	# sairToolStripMenuItem
	#
	$sairToolStripMenuItem.BackColor = 'ControlLightLight'
	$sairToolStripMenuItem.Name = "sairToolStripMenuItem"
	$sairToolStripMenuItem.ShortcutKeys = 'Ctrl+Q'
	$sairToolStripMenuItem.Size = '152, 22'
	$sairToolStripMenuItem.Text = "Quit"
	#
	# AboutToolStripMenuItem
	#
	$AboutToolStripMenuItem.Name = "AboutToolStripMenuItem"
	$AboutToolStripMenuItem.Size = '152, 22'
	$AboutToolStripMenuItem.Text = "About"
	$AboutToolStripMenuItem.add_Click($AboutToolStripMenuItem_Click)
	#
	# Searchtoolstripmenuitem
	#
	$Searchtoolstripmenuitem.BackColor = 'ControlLightLight'
	$Searchtoolstripmenuitem.Name = "Searchtoolstripmenuitem"
	$Searchtoolstripmenuitem.ShortcutKeys = 'Ctrl+A'
	$Searchtoolstripmenuitem.Size = '152, 22'
	$Searchtoolstripmenuitem.Text = "Search"
	$Searchtoolstripmenuitem.add_Click($Searchtoolstripmenuitem_Click)
	#
	# Gridcontextmenustrip
	#
	$Gridcontextmenustrip.BackColor = 'ControlLightLight'
	[void]$Gridcontextmenustrip.Items.Add($restoreToolStripMenuItem)
	[void]$Gridcontextmenustrip.Items.Add($saveReportAsToolStripMenuItem)
	$Gridcontextmenustrip.Name = "Gridcontextmenustrip"
	$Gridcontextmenustrip.Size = '153, 48'
	#
	# restoreToolStripMenuItem
	#
	$restoreToolStripMenuItem.BackColor = 'ControlLightLight'
	$restoreToolStripMenuItem.Name = "restoreToolStripMenuItem"
	$restoreToolStripMenuItem.Size = '152, 22'
	$restoreToolStripMenuItem.Text = "Restore"
	$restoreToolStripMenuItem.add_Click($restoreToolStripMenuItem_Click)
	#
	# saveReportAsToolStripMenuItem
	#
	$saveReportAsToolStripMenuItem.BackColor = 'ControlLightLight'
	[void]$saveReportAsToolStripMenuItem.DropDownItems.Add($cSVToolStripMenuItem)
	$saveReportAsToolStripMenuItem.Name = "saveReportAsToolStripMenuItem"
	$saveReportAsToolStripMenuItem.Size = '152, 22'
	$saveReportAsToolStripMenuItem.Text = "Save Report As"
	#
	# cSVToolStripMenuItem
	#
	$cSVToolStripMenuItem.BackColor = 'ControlLightLight'
	$cSVToolStripMenuItem.Name = "cSVToolStripMenuItem"
	$cSVToolStripMenuItem.Size = '152, 22'
	$cSVToolStripMenuItem.Text = "CSV"
	$cSVToolStripMenuItem.add_Click($cSVToolStripMenuItem_Click)
	#
	# savefiledialog
	#
	$savefiledialog.DefaultExt = "csv"
	$savefiledialog.FileName = "Deleted Objects Report"
	$savefiledialog.Filter = "CSV FIles | *.csv"
	$savefiledialog.InitialDirectory = "$env:USERPROFILE\Desktop"
	#
	# toolstripseparator1
	#
	$toolstripseparator1.BackColor = 'ControlLightLight'
	$toolstripseparator1.Name = "toolstripseparator1"
	$toolstripseparator1.Size = '149, 6'
	#
	# SaveAstoolstripmenuitem
	#
	$SaveAstoolstripmenuitem.BackColor = 'ControlLightLight'
	[void]$SaveAstoolstripmenuitem.DropDownItems.Add($cSVToolStripMenuItem1)
	$SaveAstoolstripmenuitem.Name = "SaveAstoolstripmenuitem"
	$SaveAstoolstripmenuitem.Size = '152, 22'
	$SaveAstoolstripmenuitem.Text = "Save As"
	#
	# cSVToolStripMenuItem1
	#
	$cSVToolStripMenuItem1.BackColor = 'ControlLightLight'
	$cSVToolStripMenuItem1.Name = "cSVToolStripMenuItem1"
	$cSVToolStripMenuItem1.Size = '152, 22'
	$cSVToolStripMenuItem1.Text = "CSV"
	$cSVToolStripMenuItem1.add_Click($cSVToolStripMenuItem1_Click)
	$MainForm.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $MainForm.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$MainForm.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$MainForm.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$MainForm.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $MainForm.ShowDialog()
}
#endregion Source: MainForm

#region Source: Globals.ps1
	#Sample function that provides the location of the script
	function Get-ScriptDirectory
	{
		if ($hostinvocation -ne $null)
		{
			Split-Path $hostinvocation.MyCommand.path
		}
		else
		{
			Split-Path $script:MyInvocation.MyCommand.Path
		}
	}
	
	#Sample variable that provides the location of the script
	[string]$ScriptDirectory = Get-ScriptDirectory
	
	
	function Search-ADDeletedAccounts {
		[CmdletBinding()]
		param(
			[Parameter(Position=0, Mandatory=$true)]
			[System.String]
			[ValidateSet("Users","Groups","Computers")]
			$ObjectType
		)
		begin {
	
		}
		process
		{
			switch ($ObjectType)
			{
				'Users' {
					$search = [ADSISEARCHER]"(&(isDeleted=TRUE)(!objectClass=computer)(objectClass=User))"
					$search.tombstone = $true
					$deletedusers = $search.Findall()
				}
				'Computers' {
					$search = [ADSISEARCHER]"(&(isDeleted=TRUE)(objectclass=computer))"
					$search.tombstone = $true
					$deletedusers = $search.Findall()
				}
				'Groups' {
					$search = [ADSISEARCHER]"(&(isDeleted=TRUE)(objectclass=group))"
					$search.tombstone = $true
					$deletedusers = $search.Findall()
				}
				default
				{
					$search = [ADSISEARCHER]"(&(isDeleted=TRUE)(!objectClass=computer)(objectClass=User))"
					$search.tombstone = $true
					$deletedusers = $search.Findall()
				}
			}
			
			$search.tombstone = $true
			$deletedusers = $search.Findall()
			foreach ($user in $deletedusers)
			{
				
				[PSCustomObject]@{
					SamAccountName = [String]$($user.Properties.samaccountname)
					Deleted = [bool]$($user.Properties.isdeleted)
					whenChanged = [String]$($user.Properties.whenchanged)
					LastKnownParent = [String]$($user.Properties.lastknownparent)
					distinguishedName = [String]$($user.Properties.distinguishedname)
				}
			}
		}
		end {
	
		}
	}
	
	
	#region Control Helper Functions
	function Load-DataGridView
	{
			<#
			.SYNOPSIS
				This functions helps you load items into a DataGridView.
		
			.DESCRIPTION
				Use this function to dynamically load items into the DataGridView control.
		
			.PARAMETER  DataGridView
				The ComboBox control you want to add items to.
		
			.PARAMETER  Item
				The object or objects you wish to load into the ComboBox's items collection.
			
			.PARAMETER  DataMember
				Sets the name of the list or table in the data source for which the DataGridView is displaying data.
		
			#>
		Param (
			[ValidateNotNull()]
			[Parameter(Mandatory = $true)]
			[System.Windows.Forms.DataGridView]$DataGridView,
			[ValidateNotNull()]
			[Parameter(Mandatory = $true)]
			$Item,
			[Parameter(Mandatory = $false)]
			[string]$DataMember
		)
		$DataGridView.SuspendLayout()
		$DataGridView.DataMember = $DataMember
		
		if ($Item -is [System.ComponentModel.IListSource]`
		-or $Item -is [System.ComponentModel.IBindingList] -or $Item -is [System.ComponentModel.IBindingListView])
		{
			$DataGridView.DataSource = $Item
		}
		else
		{
			$array = New-Object System.Collections.ArrayList
			
			if ($Item -is [System.Collections.IList])
			{
				$array.AddRange($Item)
			}
			else
			{
				$array.Add($Item)
			}
			$DataGridView.DataSource = $array
		}
		
		$DataGridView.ResumeLayout()
	}
	#endregion
	
	function Restore-ADDeletedObject
	{
		<#
			.SYNOPSIS
				A brief description of the Restore-ADObject function.
		
			.DESCRIPTION
				A detailed description of the Restore-ADObject function.
		
			.PARAMETER  DistinguishedName
				A description of the DistinguishedName parameter.
		
			.PARAMETER  SamAccountName
				A description of the SamAccountName parameter.
		
			.EXAMPLE
				PS C:\> Restore-ADObject -DistinguishedName 'Value1' -SamAccountName 'Value2'
				'This is the output'
				This example shows how to call the Restore-ADObject function with named parameters.
		
			.NOTES
				Additional information about the function or script.
		
		#>
		
		[CmdletBinding()]
		param
		(
			[Parameter(ValueFromPipeline = $true,
					   ValueFromPipelineByPropertyName = $true)]
			[ValidateNotNullOrEmpty()]
			[ValidateNotNull()]
			[string[]]
			$SamAccountName
		)
		
		Begin
		{
	
		}
		Process
		{
			$search = [ADSISEARCHER]"(&(isDeleted=TRUE)(samaccountname=$SamAccountName))"
			$search.tombstone = $true
			$deletedusers = $search.Findall()
			$user = $deletedusers
			
			[String]$cn = "CN=$($user.Properties["cn"][0].ToString().Split("`n")[0])"
			$newDN = "$cn, $($user.Properties['lastKnownParent'][0])"
			
			$credential = [System.Net.CredentialCache]::DefaultNetworkCredentials
			
			$LdapDirectoryIdentifier = New-Object System.DirectoryServices.Protocols.LdapDirectoryIdentifier (([ADSI]"LDAP://RootDSE").servername.tostring().split(",")[0].Split("=")[1])
			
			$AuthenticationType = ([System.DirectoryServices.Protocols.AuthType]::Negotiate)
			
			$connection = New-Object System.DirectoryServices.Protocols.LdapConnection ($LdapDirectoryIdentifier, $credential, $AuthenticationType)
			
			$connection.Bind()
			$connection.SessionOptions.ProtocolVersion = 3
			
			
			$search.tombstone = $true
			$deletedusers = $search.Findall()
			
			$isDeleteAttributeMod = New-Object -TypeName System.DirectoryServices.Protocols.DirectoryAttributeModification
			$isDeleteAttributeMod.Name = "isDeleted"
			$isDeleteAttributeMod.Operation = [System.DirectoryServices.Protocols.DirectoryAttributeOperation]::Delete
			
			
			$dnAttributeMod = New-Object -TypeName System.DirectoryServices.Protocols.DirectoryAttributeModification
			$dnAttributeMod.Name = "distinguishedName"
			$dnAttributeMod.Operation = [System.DirectoryServices.Protocols.DirectoryAttributeOperation]::Replace
			$dnAttributeMod.Add($newDN)
			
			$request = New-Object -TypeName System.DirectoryServices.Protocols.ModifyRequest
			$request.DistinguishedName = $($user.properties.distinguishedname)
			$request.Modifications.Add($isDeleteAttributeMod)
			$request.Modifications.Add($dnAttributeMod)
			
			$ShowDeletedControl = New-Object -TypeName System.DirectoryServices.Protocols.ShowDeletedControl
			$request.Controls.Add($ShowDeletedControl)
			try
			{
				$response = $connection.SendRequest($request)
				
				if ($response.ResultCode -eq [System.DirectoryServices.Protocols.ResultCode]::Success)
				{
					Write-output "Success!"
				}
				else
				{
					Write-Output "There was an error processing your request"
				}
			}
			catch { }
		}
		End
		{
			
		}
	}#endregion Source: Globals.ps1

#region Source: About
function Call-About
{
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
rw0AAB+LCAAAAAAABAC9V99v2joUfq+0/8HKw54Qv1JKey8gFbZOVdu1Au62t8lxTuCsjh3ZDiX7
63eSQMsu7ZJua4UUxeZ85zvH/j4bBlMQegUme8cdZ/RiUauh1/VGbw4YG1wbXKDi8gwlfOQxjE4D
nbpmYqNBa++7EhF8A+GYyxIYerPMOoibn1GF+s42z7SJy2eDPfZVg33aFHDYbOefBpuk0qUGhgpS
Z7hssJs0kCguIJvrW1DDoN/nPdE76pz4h9A+PvGYolKGXlGnx8QSZWgozpto5YyWtmyMCr0xOgHj
si1ACEjcOHVOq20MRU0hAsIL2IQFRcD1hcda20StbaYnMo+5uJ1oqY032hRxiYulKx6V4IlEUG6G
38EbdY8PG6x71K0E5Ys51iYEM3OZJOQZriF8h1zqRSX4iq8xJr6xXhOQSwvVEFTPheSC8Uo1VcbO
lvruXOTbUi93Ea/m3N4G3NQGOW7cjbboMGea0KrT8gkDoCqxc1i7J5t5v6JUm8BLzUMqiLanmP2a
jwet4n0bXu2fKYplzkir/eI2MsTliCvQ686v3PSHqn8Evivfj1rtb+A+5r3igYTwqR3fB1xqwcvt
7vgN1vFrQErd7i5LDdDGvr0Tsm/7uAZgzoNzFQK5qU76Qn5sHct/bMIFTSQGLJgVcc6XaJnTtFPs
jlsW8xBYkLEPKYaaXUtcARrOuAoZOkahEeldZoyvuMR8MQnLME4MXRHMLYHRW5gKhyskdh0xTZMm
FyEPY1S2eXDOKLHSJGB+C4zqSLSyGKDMAZE2xJURkU2B0SDO3yzkmdy20ubBwc/lNcvx/VDoeN9l
rdI39V1UnvQvbqCH++I55jlVYpk7Z6wJTZfltKZryiN+Cpaq9UbXF8/zQJv67Hb7tV2w7a22A/o9
Iqjjsgf9t+vqf/SWx8m/tYr5z8IntCmXxfGyc1DNTfrIRbErrZ8Hp9ZCTDIAu43dzGSjjayuuOIL
iOl8b56mtJXFUj/Iy68rL78TRP5x74iH/tEh+L1B657p/8yxFdpIDP6CiH/BUvb3Ghx/3ZrVjPlv
4dchMvwO1eJ3uNp+1Iv6UacT9trc59VcX2L5Oj2hIYNok83oCkIBv7Vlz+5uog28SnubruiQoNZe
oLf7YXmqDFq7f9BGPwDWo7Yfrw0AAA==#>
#endregion
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.DirectoryServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.ServiceProcess, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$About = New-Object 'System.Windows.Forms.Form'
	$richtextbox1 = New-Object 'System.Windows.Forms.RichTextBox'
	$buttonOK = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$FormEvent_Load={
		#TODO: Initialize Form Controls here
		
	}
		# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$About.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
		$script:About_richtextbox1 = $richtextbox1.Text
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$About.remove_Load($FormEvent_Load)
			$About.remove_Load($Form_StateCorrection_Load)
			$About.remove_Closing($Form_StoreValues_Closing)
			$About.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$About.SuspendLayout()
	#
	# About
	#
	$About.Controls.Add($richtextbox1)
	$About.Controls.Add($buttonOK)
	$About.AcceptButton = $buttonOK
	$About.BackColor = 'ControlLightLight'
	$About.ClientSize = '284, 262'
	$About.FormBorderStyle = 'FixedDialog'
	$About.MaximizeBox = $False
	$About.MinimizeBox = $False
	$About.Name = "About"
	$About.ShowIcon = $False
	$About.ShowInTaskbar = $False
	$About.StartPosition = 'CenterScreen'
	$About.Text = "About"
	$About.add_Load($FormEvent_Load)
	#
	# richtextbox1
	#
	$richtextbox1.BackColor = 'ControlLightLight'
	$richtextbox1.BorderStyle = 'None'
	$richtextbox1.Enabled = $False
	$richtextbox1.Location = '13, 13'
	$richtextbox1.Name = "richtextbox1"
	$richtextbox1.Size = '259, 208'
	$richtextbox1.TabIndex = 1
	$richtextbox1.Text = "This tools was made by Guido Oliveira and it is freely avaliable to improve the productivity of other Sysadmins.
I do not take responsibility for any issue or missuse of this tool.

Guido Oliveira.
GuidoOliveira.com"
	#
	# buttonOK
	#
	$buttonOK.Anchor = 'Bottom, Right'
	$buttonOK.DialogResult = 'OK'
	$buttonOK.Location = '100, 227'
	$buttonOK.Name = "buttonOK"
	$buttonOK.Size = '75, 23'
	$buttonOK.TabIndex = 0
	$buttonOK.Text = "&OK"
	$buttonOK.UseVisualStyleBackColor = $True
	$About.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $About.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$About.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$About.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$About.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $About.ShowDialog()
}
#endregion Source: About

#Start the application
Main ($CommandLine)
