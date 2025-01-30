###############
$destinationStorageProfile = "VSAN - Encrypted"
#$destinationStorageProfile = "VSAN"
$csvData = ".\input\vms-to-change-storage-policy.csv"
$vms = Get-Content -Path $csvData
 
foreach ($civm in $vms)
{
[VMware.VimAutomation.Cloud.Views.CloudClient]::ApiVersionRestriction.ForceCompatibility("37.0")
$vm = get-civm $civm
$newStorageProfile = $vm.orgvdc.ExtensionData.VdcStorageProfiles.VdcStorageProfile  | ? { $_.name -eq $destinationStorageProfile }
#$newStorageProfile = $vm.orgvdc.ExtensionData.VdcStorageProfiles.VdcStorageProfile  | ? { $_.name -eq $destinationStorageProfile }
$vm.ExtensionData.StorageProfile = $newStorageProfile
$vm.ExtensionData.UpdateServerData()
}