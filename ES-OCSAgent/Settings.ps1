function buscarCadena([String]$cadena , [String]$file) {

    # Se verifica que el fichero existe y la cadena no es nula
    if ((Test-Path -Path $file) -and $cadena) {
        $list = Get-Content $file
        # Si se encuentra la cadena se devuelve true
        if ($list -match $cadena) {
            return $true
           
        }
    }
    # Se devuelve false si no encuentra nada o el fichero no existe
    return $false
 
}

#capturamos el nombre a buscar en el fichero de ejemplo
$nom= "SAERVERIP"

#almacenamos el fichero en una variable
$fichero = "C:\ProgramData\OCS Inventory NG\Agent\ocsinventory.ini"

#ejecutamos la función con los parametros capturados
$resultado=buscarcadena $nom $fichero


#Mostramos por pantalla el resultado siendo True o False
Write-Host "Fichero encontrado = $resultado"

Start-Sleep -Seconds 120

if ($resultado -match "False"){

    stop-service "OCS Inventory Service"
    (New-Object -ComObject Scripting.FileSystemObject).CopyFile('\\GPO PATH\ocsinventory.ini', 'C:\ProgramData\OCS Inventory NG\Agent\ocsinventory.ini')
    start-service "OCS Inventory Service"
}
