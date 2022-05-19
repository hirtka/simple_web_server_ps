$root_path = "C:\www_root"
$prefix = "http://+:80/Temporary_Listen_Addresses/"

try {
    $listener = New-Object Net.HttpListener
    $listener.Prefixes.Add($prefix)
    $listener.Start()
    while ($true) {
        $context = $listener.GetContext()

        $current_date = Get-Date
        $request = $context.Request
        Write-Host("[" + $current_date + "] " + $request.HttpMethod + " " + $request.RawUrl + " (" + $request.UserAgent + ")")

        $file_path = $root_path + $request.RawUrl.Replace("/Temporary_Listen_Addresses","").Replace("/", [IO.Path]::DirectorySeparatorChar)
        if (Test-Path $file_path -PathType Container) {
            $file_path = Join-Path $file_path "index.html"
        }

        $response = $context.Response
        if (Test-Path $file_path) {
            $content = Get-Content -Path $file_path -Encoding Byte
            $contentType = switch((New-Object Io.FileInfo($file_path)).Extension){
                ".html" {"text/html"}
                ".htm"  {"text/html"}
                ".css"  {"text/css" }
                ".jpg"  {"image/jpeg" }
                ".jpeg" {"image/jpeg" }
                ".gif"  {"image/gif" }
                ".png"  {"image/png" }
                ".txt"  {"text/plain"}
                ".js"   {"application/javascript"}
                ".json" {"application/json"}
                default {"application/octet-stream"}
            }
            $response.ContentType = $contentType
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            Write-Host("Not Found: " + $file_path)
            $response.StatusCode = 404
            $content = [Text.Encoding]::UTF8.GetBytes('File not found')
            $response.ContentType = "text/plain"
            $response.OutputStream.Write($content, 0, $content.Length)
        }
        $response.Close()
    }
}
catch {
    Write-Error($_.Exception)
}
