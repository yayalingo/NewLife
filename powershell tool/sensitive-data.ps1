$extensions = "xml","txt","conf","cfg","ps1"
$patterns = "PASS","USER","SECRET","Secretkey","SSH-KEY","PrivateKey","SSH-Private"

Foreach($extension in $extensions)
{
    foreach($pattern in $patterns)
    {
        dir \ *.$extension -Recurse | select-string -pattern $pattern
    }
}

