OSProcess subclass: ExternalOSProcess [

    <category: 'OSProcess'>

    ExternalOSProcess class >>  pid: anInteger [
	<category: 'instance creation'>

	^ self new
	    pid: anInteger;
	    yourself
    ]

    | pid |

    pid: anInteger [
	<category: 'initialization'>

	pid := anInteger
    ]

    pid [
	<category: 'process'>

	^ pid
    ]
]

Eval [

    | process |
    DLD addLibrary: 'libc'.
    process := ThisOSProcess uniqueInstance forkAndDo: [ 'Hello World' printNl. [ 'true' printNl. true ] whileTrue ].
    process inspect.
    process sigKill.
]

