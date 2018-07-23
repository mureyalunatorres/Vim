" This file outlines any filtype specific configurations for .log files
setlocal nowrap noswapfile

function! AddCleanedHeaderToColumns()
    let dateTime = []
    let progName = []
    let jobName = []
    let environment = []
    let deviceNum = []

    " read DateTime and Device# for each record
    silent g/^header\tDateTime/s/.*\t\zs.*/\=add(dateTime, submatch(0))/n
    silent g/^header\tProg Name/s/.*\t\zs.*/\=add(progName, submatch(0))/n
    silent g/^header\tJob Name/s/.*\t\zs.*/\=add(jobName, submatch(0))/n
    silent g/^header\tEnvironment/s/.*\t\zs.*\zeC/\=add(environment, submatch(0))/n
    silent g/^header\tDevice#/s/.*\t\zs.*/\=add(deviceNum, submatch(0))/n

    " add dateTime and Device# to each record row
    let lineNum = 0
    let i = -1

    " loop through all lines until end of file
    while lineNum <= line('$')
        let line = getline(lineNum)
        
        " keep track of header/device count
        if line =~# 'Device#'
            let i += 1
        endif

        " prepend header data onto test result rows
        if line =~# 'PASS\|FAIL'
            let headerInfo = dateTime[i] . '\t' . progName[i] . '\t' . jobName[i] . '\t' . environment[i] . '\t' . deviceNum[i] . '\t'
            "let headerInfo = '' . dateTime[i] . '\t' . progName[i] . '\t' . jobName[i] . '\t' . environment[i] . '\t' . deviceNum[i] '\t'
            " use # symbol since dateTime has slashes /
            execute lineNum ',' lineNum 's#^#' . headerInfo . '#'
        endif

        let lineNum += 1
    endwhile
    
    " remove header and blank rows, leave only data table
    silent g/^header\|^\s*$/d

    " add header to match new columns
    " double quotes for interpolation
    let header = "DateTime\tProgram Name\tJobName\tEnvironment\tDevice#\tNumber\tSite\tResult\tTest Name\tPin\tChannel\tLow\t\Measured\tHigh\tForce\tLoc\tComment\tMissing Codes"
    call append(0,header)



endfunction

" Parse IG-XL datalog for ADC linearity results
function! ParseLogForADCResults(testName)
    " store original file name
    let fileName = expand('%:r')

    " define matches of interest
    let testName = empty(a:testName) ? @/ : a:testName
    let adcResultLines = '^.*\(PASS\|FAIL\).*' . testName . '.*$'
    let missingCodes = '^.*First 10 missing codes:.*$'
    let header = '^Datalog report\_.\{-}Device#:.*$'

    " search for and remember all matches of interest
    let hits = []
    let pattern = header . '\|' . adcResultLines . '\|' . missingCodes
    let rep = '\=add(hits, submatch(0))'
    let sub = '%s/' . pattern . '/' . rep . '/gne'
    silent execute sub

    " create scratch buffer and print out matches
    new
    setlocal buftype=nofile bufhidden=hide noswapfile nowrap

    " put all the matches into the new buffer
    silent put =hits

    " remove leading spaces
    silent %s/^\s\+//

    call CleanHeaderFromADCFiles()

    call FixMeasuredResultUnits()

    call TabDelimitADCLog()

    call AddCleanedHeaderToColumns()

    " save the cleaned data and close the buffer
    let newDir = 'cleaned_data\'
    if !isdirectory(newDir)
        mkdir(newDir)
    endif

    let newFile = newDir . fileName . '_cleaned.txt'
    execute 'write! ' . newFile

    bw!

endfunction

function! CleanHeaderFromADCFiles()
    " remove blank lines
    silent  g/^\s*$/d

    " join site number to be on single line
    silent  g/Site Number:/normal J

    " prepend header keyword and tab
    silent  g/^Datalog report/.,+12s/^/header\t/

    " change colon delimiter and spaces to tab
    silent  g/^header/s/:\s\+/\t/

    " add date time prefix
    silent  %s/header\t\zs\d\d/DateTime\t\0/

    " add blank line before header to make creating Excel table quicker
    silent  %s/^header\tDatalog report/\r\0/

    " add blank line after header to make creating Excel table quicker
    silent  %s/^header\tDevice#\t.*$/\0\r/

endfunction

function! FixMeasuredResultUnits()
    " change measurements with K, M, m, etc... unit prefixes to standard
    " notation
    silent g/PASS\|FAIL/s/-\=\d\+\.\d\+ [mMK]\=/\=StandardizeUnits(submatch(0))/g
endfunction

function! StandardizeUnits(inString)

    if a:inString =~#  'M'
        let multiplier = 1.0e6
        return printf('%d', (str2float(substitute(a:inString, ' [KMm]', '', '')) * multiplier))
    elseif a:inString =~#  'K'
        let multiplier = 1.0e3
        return printf('%.1F', (str2float(substitute(a:inString, ' [KMm]', '', '')) * multiplier))
    elseif a:inString =~#  'm'
        let multiplier = 1.0e-3
        return printf('%.7F', (str2float(substitute(a:inString, ' [KMm]', '', '')) * multiplier))
    elseif a:inString =~#  'u'
        let multiplier = 1.0e-6
        return printf('%.11F', (str2float(substitute(a:inString, ' [KMm]', '', '')) * multiplier))
    elseif a:inString =~#  'n'
        let multiplier = 1.0e-9
        return printf('%.14F', (str2float(substitute(a:inString, ' [KMm]', '', '')) * multiplier))
    else
        return a:inString
    endif

endfunction

function! TabDelimitADCLog()

    " change whitespaces to tabs
    silent! v/\(^header\)\|\(First 10 missing codes\)/s/\s\+/\t/g

    " Join missing code list to parametric result line
    " extra silent since some logs have no missing codes
    silent! g/First 10 missing codes/-1normal J
    
    " Tab Delimit missing code comment
    silent! %s/\(First 10 missing codes:\)\s\+/\1\t/
    
endfunction
