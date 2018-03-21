function Subl { 
    if ($args.Count -eq 0 ) { 
        $args = @(".") 
    }
    & "C:\Program Files\Sublime Text 3\sublime_text.exe" $args 
}